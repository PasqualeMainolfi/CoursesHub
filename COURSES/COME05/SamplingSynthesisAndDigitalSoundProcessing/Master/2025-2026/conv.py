# import section
import numpy as np
import pyaudio as pa
import librosa as lb

# main scripts
SR = 44100
CHUNK = 2048

IR_PATH = "/Users/pm/AcaHub/AudioSamples/ImpulseResponse/SOS-Convolution-sep10/IRs/59_IR_Cymbal_1.wav"
ORIGINAL = "source.wav"

AUDIO_ENGINE = pa.PyAudio()


# main function
def main() -> None:
    
    kernel_file, _ = lb.load(IR_PATH, sr=SR)
    source_file, _ = lb.load(ORIGINAL, sr=SR)
    
    p = AUDIO_ENGINE.open(
        rate=SR,
        format=pa.paFloat32,
        frames_per_buffer=CHUNK,
        channels=1,
        output=True
    )
    
    nconv = len(source_file) + len(kernel_file) - 1
    kernel_padded = np.pad(kernel_file, pad_width=(nconv - len(kernel_file),), mode='constant', constant_values=0)
    kernel_fft = np.fft.rfft(kernel_padded, n=nconv)
    source_padded = np.pad(source_file, pad_width=nconv - len(source_file), mode='constant', constant_values=0)
    source_fft = np.fft.rfft(source_padded, n=nconv)
    prod = kernel_fft * source_fft
    convolved = np.fft.irfft(prod, n=nconv)
    
    for i in range(0, nconv - CHUNK, CHUNK):
        start = i
        end = i + CHUNK
        frame = convolved[start:end]
        p.write(frame.astype(np.float32).tobytes())
    
    p.stop_stream()
    p.close()
    
    AUDIO_ENGINE.terminate()
    # plt.plot(ir)
    # plt.show()

# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()