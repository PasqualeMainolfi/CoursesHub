import mido as pm
import time


class Note:
    def __init__(self, pitch: int, velocity: int):
        self.pitch = pitch
        self.velocity = velocity
    
    def __repr__(self):
        return f"Note(pitch={self.pitch}, velocity={self.velocity})"


print("MIDE DEVICES:")
for i, device in enumerate(pm.get_input_names()):
    print(f"[{i}]: name:::[{device}]")
print("\n")

md = int(input("GET MIDI DEVICE INDEX: "))
dname = pm.get_input_names()[md]
print(f"[INFO] Connected to {dname}...")


with pm.open_input(name=dname) as m:
    
    while True:
        notes = []    
        for message in m.iter_pending():
            mes_bytes = message.bytes()
            if mes_bytes[0] == 0x90:
                notes.append(Note(pitch=mes_bytes[1], velocity=mes_bytes[2]))
        print(len(notes))
        for note in notes:
            print(note)            
            
        time.sleep(.001)