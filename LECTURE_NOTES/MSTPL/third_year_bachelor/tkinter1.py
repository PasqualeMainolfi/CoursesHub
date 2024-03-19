import tkinter as tk
import tkinter.filedialog as fd
import librosa as lb
import sounddevice as sd


SAMPLES = []
    

def carica():
    print("Hey sono il bottone")
    path = fd.askopenfilename()
    sig, _ = lb.load(path)
    SAMPLES.append(sig)
    

def play_sound():
    for sample in SAMPLES:
        sd.play(sample)
        sd.wait()
        
            

root = tk.Tk()

root.geometry("800x800")
root.title("Ciao")


main_frame = tk.Frame(master=root, background="white", height=800, width=800)
main_frame.pack()

but1 = tk.Button(master=main_frame, command=carica, bg="black", fg="Red", text="Carica File")
but1.pack(side=tk.BOTTOM)

but2 = tk.Button(master=main_frame, command=play_sound, bg="black", fg="Red", text="Play File")
but2.pack(side=tk.LEFT)





root.mainloop()
