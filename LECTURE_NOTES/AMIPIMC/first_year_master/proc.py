# import section
import subprocess
import time

# main scripts
FFPLAY_CMD = "ffplay"


# main function
def main() -> None:
    text = subprocess.run(args=[
        FFPLAY_CMD,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
    ], text=True)
    
    print(text)
        
        
        

    


# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()