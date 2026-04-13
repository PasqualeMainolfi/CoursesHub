import numpy as np
from scipy.spatial import distance
from numpy.typing import NDArray

class CartesianPoint():
    def __init__(self, x: float, y: float) -> None:
        self.y = y
        self.x = x

class PolarPoint():
    def __init__(self, rho: float, phi: float, mode: str = "degree") -> None:
        self.rho = rho
        self.phi = phi
        self.mode = mode

    def to_cartesian(self) -> CartesianPoint:
        phi_rad = self.phi
        if self.mode == "degree":
            phi_rad = self.phi * np.pi / 180.0

        x = self.rho * np.cos(phi_rad)
        y = self.rho * np.sin(phi_rad)
        return CartesianPoint(x, y)


class DBAP():
    def __init__(self, r: float) -> None:
        self.r = r
        self.a = self.calc_a()
        self.lpos = []
        self.weights = []
        self.n = 0

    def define_circle(self, n_loudspeakers: int) -> list[CartesianPoint]:
        rad_step = 2 * np.pi / n_loudspeakers
        points = []
        for i in range(n_loudspeakers):
            angle = rad_step * i
            x = np.cos(angle)
            y = np.sin(angle)
            points.append(CartesianPoint(x, y))
        return points

    def set_loudspekear(self, lpos: list[CartesianPoint], weights: list[float] | None):
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

    def get_distance_from_source(self, source: CartesianPoint) -> NDArray:
        sCartesianPoint = np.array([source.x, source.y], dtype=np.float64)
        dists = (distance.cdist([sCartesianPoint], self.lpos, metric="euclidean") + 1e-9)
        return dists.flatten()

    def calc_k(self, distances: NDArray) -> float:
        w_square = np.power(self.weights, 2)
        d = np.power(distances, 2 * self.a)
        return 1 / (np.sqrt(np.sum(w_square / d)))

    def get_gains(self, source: PolarPoint) -> NDArray:
        cpoint = source.to_cartesian()
        distances = self.get_distance_from_source(source=cpoint)
        unorm = self.weights / np.power(distances, self.a)
        k = self.calc_k(distances=distances)
        return k * unorm
