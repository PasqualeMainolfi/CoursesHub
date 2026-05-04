import librosa as lb
import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import fftconvolve
import soundfile as sf

IR    = "/Users/pm/Desktop/Audio/h026_Gym_8txts.wav"
AUDIO = "/Users/pm/Desktop/hello_ant_.wav"

SR = 44100

def main():
    ir, _ = lb.load(IR, sr=SR, mono=True)
    sig, _ = lb.load(AUDIO, sr=SR, mono=True)

    conv = fftconvolve(sig, ir, mode="full")

    # ir_len = len(ir)
    # sig_len = len(sig)
    # n = (ir_len + sig_len) - 1
    # ir_padded = np.zeros(n, dtype=np.float64)
    # sig_padded = np.zeros(n, dtype=np.float64)

    # ir_padded[:ir_len] = ir
    # sig_padded[:sig_len] = sig

    # fft_ir = np.fft.rfft(ir_padded, n=n)
    # fft_sig = np.fft.rfft(sig_padded, n=n)

    # conv = fft_ir * fft_sig
    # outs = np.fft.irfft(conv)
    conv /= np.abs(conv).max()

    # plt.plot(sig_padded)
    # plt.show()

    sf.write("/Users/pm/Desktop/hello_rev.wav", conv, samplerate=SR)



if __name__ == "__main__":
    main()
