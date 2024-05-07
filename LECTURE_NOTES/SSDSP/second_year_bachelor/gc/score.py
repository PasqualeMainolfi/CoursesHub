import random

start_offset = 0
score = ""
for i in range(100):
    
    dur = random.random() * 21 + 1
    fmin = random.uniform(90, 10000)
    fmax = random.uniform(fmin + 300, fmin + 500)
    amin = random.uniform(-24, -20)
    amax = random.uniform(-18, -16)
    pmin = random.uniform(0, 0.5)
    pmax = random.uniform(0.5, 1)
    gdurmin = random.uniform(0.1, 0.5)
    gdurmax = random.uniform(0.7, 3)
    delmin = random.uniform(0.01, 0.1)
    delmax = random.uniform(0.3, 0.5)
    
    row = f"i \"CONSTRUCTOR\" {start_offset} {dur} {fmin} {fmax} {amin} {amax} {pmin} {pmax} {gdurmin} {gdurmax} {delmin} {delmax}"
    print(row)
    
    start_offset += random.uniform(0.5, 3)
    