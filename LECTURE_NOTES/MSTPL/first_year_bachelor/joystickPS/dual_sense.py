# import section
import pydualsense


# main scripts


# main function
def main() -> None:
    pd = pydualsense.pydualsense()
    pd.init()



# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()