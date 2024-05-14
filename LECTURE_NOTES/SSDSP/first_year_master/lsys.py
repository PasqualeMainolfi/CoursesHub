VAR = ["W", "H", "Q", "E", "S"]
CONST = ""
RULES = { "W": "QQQEE", "H": "EQSS", "Q": "WH", "S": "H", "E": "Q" }
ASSIOMA = "H"

BPM = 250
BEATS = { "W": BPM / 4, "H": BPM / 2, "Q": BPM, "E": BPM * 2, "S": BPM * 4 }

lsys = ASSIOMA

seqs = []
t = 0
tmax = 10
while t < tmax:
    
    temp = ""
    for var in lsys:
        if var in RULES:
            temp += RULES[var]
        
    print(f"[n = {t}] = {lsys}")
    seqs.append(lsys)
    
    lsys = temp
    t += 1

start_time = 0
for b in seqs[5]:
    dur = 60 / BEATS[b]
    score = f"i 1 {start_time} {dur}"
    print(score)
    start_time += dur
    
