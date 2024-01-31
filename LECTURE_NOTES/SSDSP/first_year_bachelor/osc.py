# import section
import numpy as np
import matplotlib.pyplot as plt
import pyaudio as pa

# main scripts

class Oscillator():

    def __init__(self, sr: int) -> None:
        self.sr = sr
        
        self.n = 2048
        self.table = np.zeros(self.n, dtype=np.float64)
        for i in range(self.n):
            self.table[i] = np.sin(2 * np.pi * i / self.n)
        
        self.phase = 0.0
        
    def get_value(self, amp: float, freq: float) -> float:
        
        int_ndx = int(np.floor(self.phase))
        frac = self.phase - int_ndx
        
        y = (1 - frac) * self.table[int_ndx] + frac * self.table[int_ndx + 1]
        
        si = freq * self.n / self.sr
        self.phase += si
        self.phase %= self.n - 1
        
        return y * amp
        

# main function    
def main() -> None:
    
    sr = 44100
    osc = Oscillator(sr=sr)
    
    chunk = 1024
    
    portaudio = pa.PyAudio()
    
    stream = portaudio.open(
        format=pa.paFloat32,
        channels=2,
        output=True,
        rate=sr,
        frames_per_buffer=chunk
    )
    
    dur = 5
    n = int(dur * sr)
    amp = 0.7
    
    pan = 0.9
    
    for _ in range(0, n, chunk):
        frame = np.zeros(chunk, dtype=np.float64)
        for i in range(chunk):
            frame[i] = osc.get_value(amp=amp, freq=220)
        
        left = frame * (1 - pan)
        right = frame * pan
        
        y = np.vstack((left, right)).T
        y = y.astype(np.float32)
        
        stream.write(y.tobytes())
    
    stream.stop_stream()
    stream.close()
    portaudio.terminate()
    
        
    
    # sine = np.zeros(n, dtype=np.float64)
    
    # for i in range(n):
    #     sine[i] = osc.get_value(amp=1, freq=220)
    
    # plt.plot(sine)
    # plt.show()
    
    


# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()