# import section
import numpy as np
import matplotlib.pyplot as plt

# main scripts

class Oscillator():

    def __init__(self, sr: int) -> None:
        self.sr = sr
        
        self.n = 2048
        self.table = np.zeros(self.n, dtype=np.float64)
        for i in range(n):
            self.table[i] = np.sin(2 * np.pi * i / self.n)
        
        self.phase = 0.0
        
    def get_value(self, amp: float, freq: float) -> float:
        
        y = self.table[self.phase]
        si = freq * self.n / self.sr
        self.phase += si
        self.phase = int(self.phase)
        self.phase %= self.n
        
        # NEED INTERPOLATION
        
        return y
        



# main function
def main() -> None:
    ...
    


# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()