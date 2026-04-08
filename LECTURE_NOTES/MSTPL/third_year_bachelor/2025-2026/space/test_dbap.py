from dbap import DBAP, Point
import matplotlib.pyplot as plt

def main():
    loudspeakers = [
        Point(x=1.0, y=0.0),
        Point(x=0.707, y=0.707),
        Point(x=0, y=1.0),
        Point(x=-0.707, y=0.707),
        Point(x=-1.0, y=0.0),
        Point(x=-0.707, y=0.707),
        Point(x=0.0, y=-1.0),
        Point(x=0.707, y=-0.707)
    ]

    x = [p.x for p in loudspeakers]
    y = [p.y for p in loudspeakers]

    plt.plot(x, y)
    plt.show()


    # spacer = DBAP(r=-24)





if __name__ == "__main__":
    main()
