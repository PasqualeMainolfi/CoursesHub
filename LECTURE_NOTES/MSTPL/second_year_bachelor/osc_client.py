# import section
from pythonosc import udp_client
import random
import time

# main scripts

# client -> IP, PORT
IP = "127.0.0.1"
PORT = 8000

# main function
def main() -> None:
    client = udp_client.SimpleUDPClient(address=IP, port=PORT)
    
    print(f"\n[INFO] Client ready... IP: {IP}\tPORT: {PORT}\n")
        
    while True:
        amp = random.uniform(a=0.0, b=1.0) # float64
        print(f"message: {amp}")
        client.send_message("/sine/amp", amp)
        time.sleep(0.001)
        
        
# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()