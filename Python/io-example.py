import sys

def process(fin, fout):
    lines = fin.readlines()
    n = 0
    for line in lines:
        print("{:03}: {}".format(n, line), end="", file=fout)
        n += 1

for f in sys.argv[1:]:
    with open(f, "r") as fin:
        process(fin, sys.stdout)
