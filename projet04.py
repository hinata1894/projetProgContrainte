import re
affectation = re.compile(r"^(\w+)\s*=\s*(\d+)\s*$")
agent = re.compile(r"^\s*Agent \(\d+\): (.+)$")
row = re.compile(r"^\s*\d+:\s*(.+)$")

PROBLEMES = []

for pb in open("projet04.txt").read().split("===============================================================================\n"):
    pb = pb.strip()
    if not pb:
        continue
    lines = pb.split("\n")
    lines.reverse()
    lines.pop()
    lines.pop()
    d = {}
    PROBLEMES.append(d)
    while lines:
        l = lines.pop()
        m = affectation.match(l)
        if not m:
            break
        d[m.group(1)] = int(m.group(2))
    while lines:
        if l.startswith("Reunions Par Agent"):
            break
        l = lines.pop()
    reunions_par_agent = []
    d["ReunionsParAgent"] = reunions_par_agent
    while lines:
        l = lines.pop()
        m = agent.match(l)
        if not m:
            break
        reunions_par_agent.append([int(x) for x in m.group(1).strip().split()])
    while lines:
        if l.startswith("Temps De Deplacement Entre Reunions"):
            lines.pop()
            break
        l = lines.pop()
    temps_de_deplacement = []
    d["TempsDeDeplacement"] = temps_de_deplacement
    while lines:
        l = lines.pop()
        m = row.match(l)
        if m:
            temps_de_deplacement.append([int(x) for x in m.group(1).strip().split()])

import yaml, sys
yaml.dump(PROBLEMES, sys.stdout)
