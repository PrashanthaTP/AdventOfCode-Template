# Advent Of Code Challenges

## 📂 Folder Structure

```bash
📂 aoc
├── 📂 2021
│   ├── 📂 day-1
│   │   ├──  SonarSweep.py
│   │   └──  input.txt
│       .
│       .
├── 📂 2022
│   ├── 📂 day-01
│   │   ├──  CalorieCounting.py
│   │   └──  input.txt
│   └── 📂 day-02
│       ├──  Rock_Paper_Scissors.py
│       └──  input.txt
│       .
│       .
│   .
│   .
├── 📂 scripts
│   ├──  create.sh
│   ├──  download_aoc_input.ps1
│   ├──  download_aoc_input.sh
│   └── run.sh
├── 📂 templates
│   └──  template.py
│       .
│       .
└── 📂 utils
    ├──  __init__.py
    ├──  args.py
    └──  utils.py
        .   
        .   
``` 

## 📐 Setup

+ Clone this repository
```bash
git clone git@github.com:PrashanthaTP/AdventOfCode.git
```
+ Change directory
```bash
cd aoc
```
+ Create a virtual environment
```bash
python -m venv .
```
+ Activate virtual environment
```bash
source Scripts/activate #this script will be available after venv creation
```
+ Install current directory as a editable package
```bash
pip install -e .
```

> To deactivate virtual environment : `deactivate`

+ Add your Advent Of Code website's session id in `aoc/utils/.env`
```bash
cp aoc/utils/.env.sample aoc/utils/.env
# replace SESSION value
```
## 📜 Scripts

+ To create a particular day's starting code
```bash
./aoc/scripts/create.sh <day num>
```
which creates these two files `input.txt` and `<que_name>.py`
inside `aoc/<curr year>/day-<day num>`

+ To Run a particular day's code
```bash
./aoc/scripts/run.sh <day num> -n <part num for the challenge (1 or 2)>
```
<!--
## [2021](https://adventofcode.com/2021)

| Day  | Challenge                                        | Python Solution                              | 
|:-----|:-----------------------------------------------:|:---------------------------------------------:|
|1     |[SonarSweep](https://adventofcode.com/2021/day/1)|[SonarSweep.py](aoc/day-1/SonarSweep.py)       |

-->



