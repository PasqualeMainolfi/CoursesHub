import mido
import time


def print_devices(d: list[str]):
    for i, device in enumerate(d):
            print(f"[{i}]: {device}")

def main():
    d: str = ""
    while True:
        devices = mido.get_input_names();
        while not devices:
            print("[INFO] Wait for a connection...")
            time.sleep(100)
        check = input("Hai collegato questi dispositivi: ")
        print_devices(devices)
        check = input("Vuoi collegare altri dispositivi? [y/n]: ")
        if check == "n":
            break
    
    print_devices(devices)
    pindex = input("Inserisci l'indice del device: ")
    d = devices[pindex]
        
if __name__ == "__main__":
    main()
