from dbap import DBAP, PolarPoint
import matplotlib.pyplot as plt


def main():
    spacer = DBAP(r=24)
    loudspeakers = spacer.define_circle(n_loudspeakers=8)
    spacer.set_loudspekear(lpos=loudspeakers, weights=None)
    source = PolarPoint(rho=0.5, phi=125, mode="degree")
    gains = spacer.get_gains(source=source)

    x = [p.x for p in loudspeakers]
    y = [p.y for p in loudspeakers]

    csource = source.to_cartesian()

    for i, (xc, yc) in enumerate(zip(x, y)):
        plt.scatter(xc, yc, c="k", marker="o")
        plt.text(xc, yc, s=f"g = {gains[i]:.4}")
        plt.scatter(csource.x, csource.y, c="r", marker="x", lw=1.5)
        plt.plot([xc, csource.x], [yc, csource.y], lw=0.5, c="b")
    plt.show()


if __name__ == "__main__":
    main()
