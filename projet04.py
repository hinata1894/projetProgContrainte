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
#yaml.dump(PROBLEMES, sys.stdout)

for pb in PROBLEMES:
    for key in pb:
        if not isinstance(pb[key], list):
            print("int:", key, "=", pb[key],";")
        else:
            if key=="TempsDeDeplacement":
                print("array [0..NombreDeReunions, 0..NombreDeReunions] of MinTempsDeDeplacement..MaxTempsDeDeplacement:", key, "=\n", "[")
            elif key=="ReunionsParAgent":
                print("array [0..NombreDAgents, 0..NombreDeReunionsParAgent] of 0..NombreDeReunions:", key, "=\n", "[")
            keys = pb[key]
            for i in range(0, len(keys)-1):
                elem = keys[i]
                sys.stdout.write("|")
                for e in range(0,len(elem)-1):
                    sys.stdout.write(str(elem[e]))
                    sys.stdout.write(",")
                sys.stdout.write(str(elem[len(elem)-1]))
                print(",")
            elem = keys[len(keys)-1]
            sys.stdout.write("|")
            for e in range(0,len(elem)-1):
                sys.stdout.write(str(elem[e]))
                sys.stdout.write(",")
            sys.stdout.write(str(elem[len(elem)-1]))
            print("|\n];")
