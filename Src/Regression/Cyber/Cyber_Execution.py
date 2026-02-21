import openpyxl
import subprocess
import os
import shutil
import sys 
from pathlib import Path

def read_master_sheet(sheet_path):
    """ Reads a master sheet and returns a list of .robot files to run. """
    try:
        print(f"Reading master sheet from: {sheet_path}")
        wb = openpyxl.load_workbook(sheet_path)
        sheet = wb.active
        test_files = []

        for row in sheet.iter_rows(min_row=2, values_only=True):  # Skip the header row
            if len(row) >= 3:
                test_case, suite, run = row[:3]  # Unpack only the first three values
            if str(run).strip().lower() == "yes":
                suite_path = Path(sheet_path).parent / suite
                if suite_path.exists():
                    test_files.append(str(suite_path))
                else:
                    print(f"Warning: Test file {suite_path} does not exist.")

        print(f"Test files to run from {sheet_path}: {test_files}")
        return test_files
    except Exception as e:
        print(f"Error reading master sheet {sheet_path}: {e}")
        return []

def execute_tests_in_parallel(test_files, processes, output_folder, allure_results_folder):
    """ Executes test cases in parallel using pabot and generates an Allure report. """
    try:
        if not test_files:
            print("No test files to execute.")
            return

        print(f"Executing tests in parallel with {processes} processes: {test_files}")

        # Ensure allure-results folder exists
        Path(allure_results_folder).mkdir(parents=True, exist_ok=True)

        # Run tests with Allure listener
        result = subprocess.run([
            "pabot",
            "--processes", str(processes),
            "--listener", f"allure_robotframework;{allure_results_folder}"
        ] + test_files, check=True)

        print(f"Test execution completed with result: {result.returncode}")

        # Move output files
        move_output_files(output_folder)

        # Generate Allure report
        generate_allure_report(allure_results_folder)

    except subprocess.CalledProcessError as e:
        print(f"Error during execution: {e}")
        sys.exit(e.returncode)     # <-- FAIL CI when tests fail
    except FileNotFoundError as e:
        print(f"Pabot not found: {e}")
        sys.exit(1)               # <-- FAIL CI when pabot is missing

def move_output_files(destination_folder):
    """ Moves Robot Framework output files to the specified folder. """
    try:
        destination_folder = Path(destination_folder).resolve()
        print(f"Absolute path to destination folder: {destination_folder}")

        # Ensure the destination folder exists
        destination_folder.mkdir(parents=True, exist_ok=True)

        output_files = ["output.xml", "log.html", "report.html"]

        for file_name in output_files:
            source_path = Path.cwd() / file_name
            destination_path = destination_folder / file_name

            if source_path.exists():
                shutil.move(str(source_path), str(destination_path))
                print(f"Moved {file_name} to {destination_folder}")
            else:
                print(f"File {file_name} not found. Skipping.")

    except Exception as e:
        print(f"Error moving files: {e}")

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
        sys.exit(e.returncode)     # <-- FAIL CI when tests fail
    except FileNotFoundError as e:
        print(f"Allure not found: {e}. Ensure Allure is installed and in your PATH.")
        sys.exit(1)               # <-- FAIL CI when pabot is missing

if __name__ == "__main__":
    master_sheets = [
                     "Cyber_MasterSheet.xlsx",

                     ]

    output_folder = "Cyber_results"
    allure_results_folder = "allure-results"

    all_test_files = []

    for master_sheet_path in master_sheets:
        if not os.path.exists(master_sheet_path):
            print(f"Master sheet not found at: {master_sheet_path}")
        else:
            test_files_to_run = read_master_sheet(master_sheet_path)
            all_test_files.extend(test_files_to_run)

    if not all_test_files:
        print("No test files marked as 'Yes' to execute. Exiting.")
        sys.exit(1)   # <-- FAIL CI if nothing ran
    else:
        processes = 1
        execute_tests_in_parallel(all_test_files, processes, output_folder, allure_results_folder)
