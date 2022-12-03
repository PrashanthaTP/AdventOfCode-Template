# Name <que name>
# Part 1: 
# Part 2:

import os
from aoc import utils


curr_dir=os.path.dirname(__file__)
input_filepath=os.path.join(curr_dir,"input.txt") 
testcase=utils.get_input_list(filepath=input_filepath)

def part1():
    pass

def part2():
    pass

def run(name,level):
    print("Que: {}".format(name))
    print("Part {}".format(level))
    if level==1:
        return part1()
    else:
        
        return part2()

if __name__ == "__main__":
    options = utils.parse_cmd_arguments()
    ans = run("<que name>",options.level)
    print(ans)
