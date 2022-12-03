import os
import subprocess
from typing import List


def get_input_list(filepath: str, target_type=int) -> List[int]:
    read_lines = []
    with open(filepath, 'r') as file:
        for line in file:
            if line.strip():
                read_lines.append(target_type(line))
            else:
                read_lines.append(line)
                
    return read_lines
    #return list(map(target_type, file.readlines()))


def get_root_dir() -> str:
    #curr_file_dir = os.path.dirname(os.path.abspath(__file__))
    #return os.path.join(curr_file_dir, "..")
    cmd = ["git","rev-parse","--show-toplvel"]
    out = subprocess.run(cmd,capture_output=True,text=True)
    if(out.stderr):
        return None
    else:
        return out.stdout.strip("\n")

def download_input(year,day):pass


def get_input():
    pass
