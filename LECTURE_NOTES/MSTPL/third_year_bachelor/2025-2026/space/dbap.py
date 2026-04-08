import numpy as np
from scipy.spatial import distance
from numpy.typing import NDArray


class Point():
    def __init__(self, x: float, y: float) -> None:
        self.x = x
        self.y = y

class DBAP():
    def __init__(self, r: float) -> None:
        self.r = r
        self.a = self.calc_a()
        self.lpos = []
        self.weights = []
        self.n = 0

    def set_loudspekear(self, lpos: list[Point], weights: list[float] | None):
        self.n = len(lpos)
        self.lpos = np.zeros(shape=(self.n, 2), dtype=np.float64)
        self.weights = np.ones(self.n, dtype=np.float64)

        for i, p in enumerate(lpos):
            self.lpos[i, 0] = p.x
            self.lpos[i, 1] = p.y
            if weights is not None:
                self.weights[i] = weights[i]

    def calc_a(self):
        return self.r / (20 * np.log10(2))

    def get_distance_from_source(self, source: Point) -> NDArray:
        spoint = np.array([source.x, source.y], dtype=np.float64)
        return distance.cdist(spoint, self.lpos, metric="euclidean")

    def calc_k(self, distances: NDArray) -> float:
        w_square = np.power(self.weights, 2)
        d = np.power(distances, 2 * self.a)
        return 1.0 / np.sqrt(np.sum(w_square / d))

    def get_gains(self, source: Point) -> NDArray:
        distances = self.get_distance_from_source(source=source)
        k = self.calc_k(distances=distances)
        return k / np.power(distances, self.a)
