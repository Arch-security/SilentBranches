import re
from collections import defaultdict

with open("run_all_output.log", "r") as f:
    lines = f.readlines()

data = defaultdict(list)
rcx = None

for line in lines:
    line = line.strip()
    if line.startswith("=== RCX ="):
        rcx = int(re.findall(r"RCX = (\d+)", line)[0])
    elif line.startswith("got time") and rcx is not None:
        time = int(re.findall(r"got time (\d+)", line)[0])
        data[rcx].append(time)

time_thresholds = [90, 100, 110, 120, 130, 140, 150, 160, 170, 180]

for time_threshold in time_thresholds:
    print(f"\nUsing time threshold = {time_threshold}\n")
    print(f"{'RCX':>6} | {'# Total':>7} | {'# <=threshold':>13} | {'# >threshold':>13} | {'>threshold %':>10}")
    print("-" * 50)

    best_rcx = None
    max_high_ratio = 0

    for rcx in sorted(data.keys()):
        times = data[rcx]
        low = [t for t in times if t <= time_threshold]
        high = [t for t in times if t > time_threshold]
        total = len(times)
        high_ratio = len(high) / total if total > 0 else 0
        print(f"{rcx:6} | {total:7} | {len(low):13} | {len(high):13} | {high_ratio*100:10.1f}%")

        if high_ratio > max_high_ratio:
            max_high_ratio = high_ratio
            best_rcx = rcx

    print("\n>>> Best RCX value (highest >threshold % rate):", best_rcx)
