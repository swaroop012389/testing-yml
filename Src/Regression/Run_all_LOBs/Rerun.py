import os
import shutil
import subprocess
from pathlib import Path
import requests
import openpyxl
from defusedxml.ElementTree import parse

# -------------------------
# Config
# -------------------------
MASTER_SHEETS = [
    "../AE/AE_MasterSheet.xlsx",
    # add other ...
]

OUTPUT_FOLDER = Path("Results").resolve()
ALLURE_RESULTS_FOLDER = Path("allure-results").resolve()
ALLURE_REPORT_FOLDER = Path("allure-report").resolve()

# -------------------------
# Helpers
# -------------------------
def read_master_sheet(sheet_path):
    try:
        sheet_path = Path(sheet_path).resolve()
        wb = openpyxl.load_workbook(sheet_path)
        sheet = wb.active
        test_files = []
        for row in sheet.iter_rows(min_row=2, values_only=True):
            if len(row) < 3:
                continue
            test_case, suite, run_flag = row[:3]
            if str(run_flag).strip().lower() == "yes":
                suite_path = sheet_path.parent / suite
                if suite_path.exists():
                    test_files.append(str(suite_path.resolve()))
                else:
                    print(f"[WARN] Test file missing: {suite_path}")
        return test_files
    except Exception as e:
        print(f"[ERROR] reading master sheet {sheet_path}: {e}")
        return []

def ensure_clean_folder(p: Path):
    if p.exists():
        shutil.rmtree(p)
    p.mkdir(parents=True, exist_ok=True)

def get_robot_summary(xml_path):
    xml_path = Path(xml_path)
    if not xml_path.exists():
        return "No output file", []
    tree = parse(str(xml_path))
    root = tree.getroot()
    total = passed = failed = 0
    testcases = []
    for test in root.iter("test"):
        total += 1
        name = test.attrib.get("name")
        status = test.find("status").attrib.get("status")
        if status == "PASS":
            passed += 1
        else:
            failed += 1
        testcases.append((name, status))
    summary = f"Total: {total}\nPassed: {passed}\nFailed: {failed}\n"
    return summary, testcases

def send_to_teams(summary, testcases, allure_url=None):
    text_sections = [
        {
            "text": "**Test Case Execution Details:**\n" +
                    "\n".join([f"- {n}: {'✔ PASS' if s=='PASS' else '❌ FAIL'}" for n, s in testcases])
        }
    ]
    if allure_url:
        text_sections.append({"text": f"📊 **Allure Report:** [Click to Open]({allure_url})"})
    payload = {
        "@type": "MessageCard",
        "@context": "https://schema.org/extensions",
        "themeColor": "0076D7",
        "title": "🏁 Final Test Execution Summary",
        "text": f"```\n{summary}\n```",
        "sections": text_sections
    }
    try:
        resp = requests.post(TEAMS_WEBHOOK, json=payload)
        if resp.status_code == 200:
            print("[INFO] Teams notification sent.")
        else:
            print(f"[WARN] Teams response: {resp.status_code} {resp.text}")
    except Exception as e:
        print(f"[ERROR] Sending Teams message: {e}")

# -------------------------
# Core Execution Functions
# -------------------------
def execute_pabot(test_files, processes, output_folder, allure_results_folder):
    """
    Run pabot with --outputdir so robot outputs land in output_folder.
    Use absolute path for allure listener.
    """
    if not test_files:
        print("[WARN] No tests to run")
        return False

    ensure_clean_folder(allure_results_folder)  # clean previous allure-results
    ensure_clean_folder(output_folder)         # ensure output dir exists

    # build cmd: pabot --processes N --listener allure_robotframework;<allure_results_folder> --outputdir <output_folder> <test_files...>
    cmd = [
        "pabot",
        "--processes", str(processes),
        "--listener", f"allure_robotframework;{str(allure_results_folder)}",
        "--outputdir", str(output_folder)
    ] + test_files

    print("[INFO] Running pabot:", " ".join(cmd))
    try:
        subprocess.run(cmd, check=True)
        print("[INFO] pabot completed")
        return True
    except subprocess.CalledProcessError as e:
        print(f"[ERROR] pabot failed: {e}")
        return False

def rerun_failed(output_folder, processes, allure_results_folder):
    """
    Rerun failed tests using pabot --rerunfailed pointing to output.xml inside output_folder.
    Produces rerun_output.xml inside the same output_folder.
    """
    orig_output = output_folder / "output.xml"
    rerun_output = output_folder / "rerun_output.xml"

    if not orig_output.exists():
        print(f"[WARN] Original output not found at {orig_output}. Cannot rerun.")
        return False

    # run pabot rerunfailed
    cmd = [
        "pabot",
        "--processes", str(processes),
        "--rerunfailed", str(orig_output),
        "--output", str(rerun_output.name),   # name only, but with --outputdir below we set folder
        "--outputdir", str(output_folder),
        "--listener", f"allure_robotframework;{str(allure_results_folder)}"
    ]
    print("[INFO] Re-running failed tests with:", " ".join(cmd))
    try:
        subprocess.run(cmd, check=True)
        print("[INFO] Rerun completed, rerun output at:", rerun_output)
        return True
    except subprocess.CalledProcessError as e:
        print(f"[ERROR] Rerun failed: {e}")
        return False

def merge_results(output_folder):
    """
    Merge output.xml and rerun_output.xml into output_merged.xml inside output_folder.
    If rerun file not present, return original output path.
    """
    original = output_folder / "output.xml"
    rerun = output_folder / "rerun_output.xml"
    merged = output_folder / "output_merged.xml"

    if not rerun.exists():
        print("[INFO] No rerun output found, skipping merge")
        return original

    cmd = [
        "rebot",
        "--merge",
        str(original),
        str(rerun),
        "--output", str(merged.name)
    ]
    print("[INFO] Merging outputs:", " ".join(cmd))
    try:
        subprocess.run(cmd, check=True, cwd=str(output_folder))
        print("[INFO] Merged output available at:", merged)
        return merged
    except subprocess.CalledProcessError as e:
        print(f"[ERROR] Merge failed: {e}")
        return original

def generate_allure(allure_results_folder, allure_report_folder):
    if not allure_results_folder.exists() or not any(allure_results_folder.iterdir()):
        print(f"[WARN] No Allure results in {allure_results_folder}")
        return False
    ensure_clean_folder(allure_report_folder)
    cmd = ["C:\\allure-2.31.0\\bin\\allure.BAT", "generate", str(allure_results_folder), "-o", str(allure_report_folder), "--clean"]
    print("[INFO] Generating Allure:", " ".join(cmd))
    try:
        subprocess.run(cmd, check=True)
        print("[INFO] Allure generated at", allure_report_folder)
        return True
    except Exception as e:
        print(f"[ERROR] Allure generation failed: {e}")
        return False

# -------------------------
# Main
# -------------------------
def main():
    # read master sheets
    all_test_files = []
    for ms in MASTER_SHEETS:
        if Path(ms).exists():
            all_test_files.extend(read_master_sheet(ms))
        else:
            print(f"[WARN] master sheet not found: {ms}")

    if not all_test_files:
        print("[INFO] No tests to run.")
        return

    # 1) run pabot, outputdir -> OUTPUT_FOLDER (Results)
    ok = execute_pabot(all_test_files, processes=6, output_folder=OUTPUT_FOLDER, allure_results_folder=ALLURE_RESULTS_FOLDER)
    if not ok:
        print("[ERROR] initial run failed, proceeding to attempt rerun of any produced failures...")

    # 2) rerun failed tests (uses Results/output.xml as source)
    rerun_ok = rerun_failed(OUTPUT_FOLDER, processes=4, allure_results_folder=ALLURE_RESULTS_FOLDER)

    # 3) merge results (if rerun produced output)
    final_output = merge_results(OUTPUT_FOLDER)

    # 4) generate Allure from ALLURE_RESULTS_FOLDER (Allure listener wrote results during both runs)
    generate_allure(ALLURE_RESULTS_FOLDER, ALLURE_REPORT_FOLDER)

    # 5) produce summary from merged output (or original if merge skipped)
    summary, testcases = get_robot_summary(str(final_output))
    # Optional: compute local file URL for Allure index.html
    allure_url = f"file://{str(ALLURE_REPORT_FOLDER.resolve()/ 'index.html')}" if ALLURE_REPORT_FOLDER.exists() else None

    # 6) send Teams
    send_to_teams(summary, testcases, allure_url)
    print("[DONE]")

if __name__ == "__main__":
    main()
