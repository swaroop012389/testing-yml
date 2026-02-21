import csv
import os
from datetime import datetime
from pathlib import Path

header = ["TestcaseID", "Work-ID", "PolicyNumber"]
header_sae = ["TestcaseID", "AppID", "PolicyNumber", "Status"]
header_alt = ["TestcaseID", "Testcase Name", "PolicyNumber"]
header_tms = ["TestcaseID", "PolicyNumber"]


def create_res(filename):
    if os.path.isfile(filename):
        move_file(filename)
    with open(filename, 'w', newline='') as csvfile:
        csvwriter = csv.DictWriter(csvfile, header)
        csvwriter.writeheader()


def create_sae_res(filename):
    if os.path.isfile(filename):
        move_file(filename)
    with open(filename, 'w', newline='') as csvfile:
        csvwriter = csv.DictWriter(csvfile, header_sae)
        csvwriter.writeheader()


def create_alt_res(filename):
    if os.path.isfile(filename):
        move_file(filename)
    with open(filename, 'w', newline='') as csvfile:
        csvwriter = csv.DictWriter(csvfile, header_alt)
        csvwriter.writeheader()

def create_tms_res(filename):
    if os.path.isfile(filename):
        move_file(filename)
    with open(filename, 'w', newline='') as csvfile:
        csvwriter = csv.DictWriter(csvfile, header_tms)
        csvwriter.writeheader()

def write_res(filename, row):
    with open(filename, 'a', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(row)

def move_file(filename):
    now = datetime.now()
    current_time = now.strftime("_%m%d%Y_%H%M")
    dir_name = filename.split("\\")
    req_dir = '\\'.join(dir_name[0:-1]) + "\\backup\\"
    file_name = dir_name[-1]
    print(req_dir)
    split_name = file_name.split(".")
    file_name, ext = split_name[0], split_name[1]
    new_file_name = file_name + current_time + "." + ext
    Path(filename).rename(req_dir+new_file_name)