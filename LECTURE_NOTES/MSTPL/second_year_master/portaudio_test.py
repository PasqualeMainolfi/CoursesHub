# import section
import pyaudio as pa
import numpy as np
import matplotlib.pyplot as plt
import time
import scipy
import scipy.signal

# main scripts
SR = 44100
CHANNELS = 1
CHUNK = 2048



# main function
def main() -> None:
    engine = pa.PyAudio()
    stream = engine.open(
        format=pa.paFloat32,
        channels=CHANNELS,
        rate=SR,
        output=True,
        frames_per_buffer=CHUNK
    )
    
    lookup = np.sin(2 * np.pi * np.arange(SR) / SR)

    phase = 0
    frame = np.zeros(CHUNK, dtype=np.float32)
    while True:
        try:
            si = 440 * len(lookup) / SR
            for i in range(CHUNK):
                intpart = int(np.floor(phase))
                frac_part = phase - intpart
                sample = (1 - frac_part) * lookup[intpart] + frac_part * lookup[intpart + 1]
                frame[i] = sample * np.sqrt(2)
                phase += si
                phase = phase if phase < len(lookup) - 1 else phase - len(lookup)
            # frame -> DSP 
            frame *= 0.707
            # DSP -> OUT
            stream.write(frame.tobytes())
            time.sleep(1 / (CHUNK * 0.5))
        except KeyboardInterrupt:
            print("[INFO] Process interrupted by user!")
            break
    
    stream.close()
    engine.terminate()
    
    



# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()