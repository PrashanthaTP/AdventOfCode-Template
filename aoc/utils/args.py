import argparse


def parse_cmd_arguments():
    parser = argparse.ArgumentParser(description="AOC Challenge",
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("-n","--level",
                        help="level number",
                        type=int,
                        default=1)
    
    return parser.parse_args()
