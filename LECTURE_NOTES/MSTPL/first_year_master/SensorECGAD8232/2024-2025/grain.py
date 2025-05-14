# import section
import numpy as np
import librosa as lb
from numpy.typing import NDArray
import matplotlib.pyplot as plt

# main scripts
SR = 44100


class Quanta():
    def __init__(self, fs: float): # non ho capito cosa fa questo metodo
        self.sample_rate = fs # a cosa serve il self?
        self.signals = dict() # che cosa è un dict?
    
    def load_audio(self, audio_path: str, signal_id: str) -> None: # che cosa significa la freccia?
        audio, _ = lb.load(audio_path, sr=self.sample_rate, mono=True)
        if signal_id in self.signals:
            print("[WARNING] File not loaded, name already exist! Change the name and reload the audio file...")
        else:
            self.signals[signal_id] = audio
    
    def get_phase_index(self, start: int, end: int, quanta_length: int) -> tuple[int, int]:
        grain_range = end - start
        if quanta_length > grain_range:
            quanta_length = grain_range
        return quanta_length, np.random.random_integers(low=start, high=end - quanta_length)
    
    def get_quanta(self, signal_id: str, duration_range: float, pitch_range: float) -> NDArray[np.float64]:
        assert len(self.signals) >= 1, "[ERROR] You have to load audio file first!"
        n = len(self.signals[signal_id])
        duration = np.random.uniform(low=duration_range[0], high=duration_range[1])
        gsize = int(duration * self.sample_rate)
        gsize, phase = self.get_phase_index(start=0, end=n, quanta_length=gsize)
        grain = self.signals[signal_id][phase:phase + gsize]
        grain = grain * np.hanning(gsize)
        return grain

# main function
def main() -> None:
    grain_generator = Quanta(fs=SR)
    grain_generator.load_audio(audio_path="/Users/pm/AcaHub/AudioSamples/modulator2244100.wav", signal_id="mod")
    
    audio = grain_generator.get_quanta(signal_id="mod", duration_range=(0.001, 0.1), pitch_range=(0.5, 3))
    
    plt.plot(audio)
    plt.xlabel("Samples")
    plt.ylabel("Amplitude")
    plt.show()
    
    



# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()