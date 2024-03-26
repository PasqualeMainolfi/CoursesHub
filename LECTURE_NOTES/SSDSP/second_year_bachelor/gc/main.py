# import section
import librosa as lb
import numpy as np
import pyaudio as pa
import time


# main scripts
PATH = "./../bell.wav"

CHUNK = 1024
CHANNELS = 1
SR = 44100
FORMAT = pa.paFloat32

def open_file(path: str) -> np.ndarray:
    sig, _ = lb.load(path, sr=None)
    return sig
    
# main function
def main() -> None:
    
    
    p = pa.PyAudio()
    
    for i in range(p.get_device_count()):
        device = p.get_device_info_by_index(i)
        name = device["name"]
        sr = device["defaultSampleRate"]
        inchn = device["maxInputChannels"]
        outchn = device["maxOutputChannels"]
        
        s = f"""
        [DEVICE]:
            index: [{i}]
            name: [{name}]
            sample rate: [{sr}]
            max input channels: [{inchn}]
            max output channels: [{outchn}]
        """
        
        print(s)
        
    device_index = int(input("Get me the index of the output device: "))

    stream = p.open(
        format=FORMAT,
        frames_per_buffer=CHUNK,
        rate=SR,
        channels=CHANNELS,
        output=True,
        output_device_index=device_index
    )
    
    sig = open_file(path=PATH)
    n = sig.size
    for i in range(0, n, CHUNK):
        
        start = i
        end = min(n, start + CHUNK)
        
        frame = np.zeros(CHUNK, dtype=np.float64)
        frame[:end - start] = sig[start:end]
        
        frame *= np.hanning(CHUNK)
        
        frame_casted = frame.astype(np.float32)
        coded_frame = frame_casted.tobytes()
        
        stream.write(coded_frame)
        
        time.sleep(.1)
    
    stream.stop_stream()
    stream.close()
    p.terminate()


# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()