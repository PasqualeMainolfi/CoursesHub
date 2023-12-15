import numpy as np

class DelayLine():
    def __init__(self, buffer_size: int) -> None:
        self.buffer_size = buffer_size
        self.buffer = np.zeros(buffer_size, dtype=np.float64)
        self.p = 0
    
    def read(self) -> float:
        return self.buffer[self.p]
    
    def tick(self, value: float) -> None:
        self.buffer[self.p] = value
        self.p += 1
        self.p %= self.buffer_size

