import scipy.signal as scs
import librosa as lb
import numpy as np
from numpy.typing import NDArray
from dataclasses import dataclass


@dataclass
class FFTParams:
    wsize: int
    hsize: int
    sr: int

class Kernel():
    def __init__(self, shape: tuple[int, int]) -> None:
        self.kernel_heigth = shape[0]
        self.kernel_width = shape[1]
        self.center = (self.kernel_heigth // 2, self.kernel_width // 2)

    def apply(self, block: NDArray) -> tuple[int, int] | None:
        max_value = np.max(block)
        if max_value == block[self.center[0], self.center[1]]:
            return self.center
        else:
            return None


@dataclass
class Star():
    fbin: int # f = n * sr / wsize
    tbin: int # t = n * (hopsize / sr)
    a: float

class Costellation():
    ...

class FingerPrinted():
    def __init__(self, fft_params: FFTParams, kernel: Kernel) -> None:
        self.fft_params = fft_params
        self.kernel = kernel
        self.stars = []
        self.costellations = []


    def open_audio(self, audio_path: str) -> NDArray | None:
        try:
            sig, _ = lb.load(audio_path, sr=self.fft_params.sr, mono=True)
            return sig
        except Exception as e:
            print(f"[WARNING] Soomething wenbt wrong: {e}")
            return None

    def generate_costellation(self, audio_vec: NDArray | None, npairs: int, lthresh: float) -> None:
        if audio_vec is None:
            return

        real_overlap = self.fft_params.wsize - self.fft_params.hsize
        f, t, spectrum = scs.stft(audio_vec, nperseg=self.fft_params.wsize, noverlap=real_overlap, window="hann", fs=self.fft_params.sr)
        ps = lb.amplitude_to_db(np.abs(spectrum))
        row, col = ps.shape[0], ps.shape[1]

        for c in range(0, col - self.kernel.kernel_width, self.kernel.kernel_width):
            c_end = min(col, c + self.kernel.kernel_width)
            for r in range(0, row - self.kernel.kernel_heigth, self.kernel.kernel_heigth):
                r_end = min(row, r + self.kernel.kernel_heigth)
                block = ps[r:r_end, c:c_end]
                kernel_ans = self.kernel.apply(block=block)
                if kernel_ans is not None:
                    fbin, tbin = r + kernel_ans[0], c + kernel_ans[1]
                    a = ps[fbin, tbin]
                    s = Star(fbin=fbin, tbin=tbin, a=a)
                    self.stars.append(s)


def main():
    ...


if __name__ == "__main__":
    main()
