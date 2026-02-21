import os
import shutil
import subprocess
from pathlib import Path
# import requests
import openpyxl
from defusedxml.ElementTree import parse

# ==========================================================
#               MASTER SHEET READER
# ==========================================================

def read_master_sheet(sheet_path):
    """Reads a master sheet and returns a list of .robot files to run."""
    try:
        sheet_path = Path(sheet_path).resolve()
        print(f"[INFO] Reading master sheet: {sheet_path}")

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
                    test_files.append(str(suite_path))
                else:
                    print(f"[WARN] Test file missing: {suite_path}")

        print(f"[INFO] Selected test files: {test_files}")
        return test_files

    except Exception as e:
        print(f"[ERROR] Failed reading master sheet: {e}")
        return []


# ==========================================================
#               TEST EXECUTION USING PABOT
# ==========================================================

def execute_tests(test_files, processes, output_folder, allure_results_folder):
    """Executes test cases using pabot with allure listener."""
    if not test_files:
        print("[WARN] No test files to execute.")
        return

    try:
        Path(allure_results_folder).mkdir(parents=True, exist_ok=True)

        print(f"[INFO] Executing tests with {processes} process(es)")

        subprocess.run([
            "pabot",
            "--processes", str(processes),
            "--listener", f"allure_robotframework;{allure_results_folder}"
        ] + test_files, check=True)

        print("[INFO] Test execution completed")

        move_output_files(output_folder)
        generate_allure_report(allure_results_folder)

    except subprocess.CalledProcessError as e:
        print(f"[ERROR] Test execution failed: {e}")
    except FileNotFoundError:
        print("[ERROR] Pabot not found! Install using: pip install pabot")

def generate_allure_report(allure_results_folder):
    """ Generates an Allure report from test results. """
    try:
        if not os.path.exists(allure_results_folder) or not os.listdir(allure_results_folder):
            print(f"No Allure results found in {allure_results_folder}. Report not generated.")
            return

        print(f"Generating Allure report from {allure_results_folder}")

        subprocess.run(
            [r"C:\allure-2.31.0\bin\allure.BAT", "generate", allure_results_folder, "-o", "allure-report", "--clean"],
            check=True)

        print("Allure report generated successfully in 'allure-report' folder.")
        print("To view the report, run: allure serve allure-report")
    except subprocess.CalledProcessError as e:
        print(f"Error generating Allure report: {e}")
    except FileNotFoundError as e:
        print(f"Allure not found: {e}. Ensure Allure is installed and in your PATH.")

# ==========================================================
#               MOVE OUTPUT FILES
# ==========================================================

def move_output_files(destination_folder):
    """Moves Robot Framework output files to an output directory."""
    try:
        destination_folder = Path(destination_folder).resolve()
        destination_folder.mkdir(parents=True, exist_ok=True)

        output_files = ["output.xml", "log.html", "report.html"]

        for file_name in output_files:
            src = Path(file_name)
            dst = destination_folder / file_name

            if src.exists():
                shutil.move(str(src), str(dst))
                print(f"[INFO] Moved {file_name} → {destination_folder}")
            else:
                print(f"[WARN] File not found: {file_name}")

    except Exception as e:
        print(f"[ERROR] Could not move output files: {e}")


# ==========================================================
#               EXTRACT ROBOT SUMMARY
# ==========================================================

# def get_robot_summary(output_xml):
#     """Extracts test summary using secure XML parser."""
#     tree = parse(output_xml)
#     root = tree.getroot()
#
#     total = passed = failed = 0
#     testcases = []
#
#     for test in root.iter("test"):
#         total += 1
#         name = test.attrib.get("name")
#         status = test.find("status").attrib.get("status")
#
#         if status == "PASS":
#             passed += 1
#         else:
#             failed += 1
#
#         testcases.append((name, status))
#
#     summary = (
#         f"Total Test Cases Executed: {total}\n"
#         f"Passed: {passed} ✔️\n"
#         f"Failed: {failed} ❌\n"
#     )

    return summary, testcases


# ==========================================================
#               SEND TO MICROSOFT TEAMS
# ==========================================================



# def send_to_teams(summary, testcases):
#     """Sends Robot test summary to Microsoft Teams."""
#     payload = {
#         "@type": "MessageCard",
#         "@context": "https://schema.org/extensions",
#         "themeColor": "0076D7",
#         "title": "🏁 Smoke Test Execution Summary",
#         "text": f"```\n{summary}\n```",
#         "sections": [
#             {
#                 "text": "**Test Case Execution Details:**\n" +
#                         "\n".join([
#                             f"- {name}: {'✔ PASS' if status=='PASS' else '❌ FAIL'}"
#                             for name, status in testcases
#                         ])
#             }
#         ]
#     }
#
#     try:
#         resp = requests.post(TEAMS_WEBHOOK, json=payload)
#         if resp.status_code == 200:
#             print("[INFO] Teams notification sent successfully.")
#         else:
#             print(f"[ERROR] Teams notification failed: {resp.text}")
#     except Exception as e:
#         print(f"[ERROR] Failed sending Teams message: {e}")


# ==========================================================
#                        MAIN
# ==========================================================

if __name__ == "__main__":

    master_sheets = [
        "../AE/AE_MasterSheet.xlsx",
        "../BR/BR_MasterSheet.xlsx",
        "../CE/CE_MasterSheet.xlsx",
        "../Cyber/Cyber_MasterSheet.xlsx",
        "../IA/IA_MasterSheet.xlsx",
        "../KNR/K&R_MasterSheet.xlsx",
        "../MGMT-LIAB/ML_NFP_PNB_Mastersheet.xlsx",
        "../ML-PRIVATE/Ml-Private_Mastersheet.xlsx",
        "../Raven/Raven_MasterSheet.xlsx",
        "../RE/REO_MasterSheet.xlsx",
        "../StorageTank/ST_MasterSheet.xlsx",
    ]

    output_folder = "Results"
    allure_results_folder = "allure-results"

    all_test_files = []

    for sheet in master_sheets:
        if Path(sheet).exists():
            all_test_files.extend(read_master_sheet(sheet))
        else:
            print(f"[WARN] Master sheet not found: {sheet}")

    if all_test_files:
        execute_tests(all_test_files, processes=3,
                      output_folder=output_folder,
                      allure_results_folder=allure_results_folder)

        # summary, testcases = get_robot_summary("output.xml")
        # send_to_teams(summary, testcases)
    else:
        print("[INFO] No test cases marked YES.")
