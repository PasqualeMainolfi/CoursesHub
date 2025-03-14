# import section
import numpy as np
import argparse
import os

# main scripts
def create_data_vec(file_path: str) -> np.ndarray:
    values = []

    with open(file_path, "r") as f:

        lines = f.readlines()
        for i, l in enumerate(lines):
            if i > 0:
                m = l.strip().split(",")
                values.append([int(m[0]), int(m[1])])
                
    return np.array(values) 

def to_binary(x: np.ndarray, col: int) -> list[str]:
    to_bit = []
    for i in range(x.shape[0]):
        b = np.binary_repr(x[i, 1], width=10)
        to_bit.append(b)
    return to_bit

def write_data_to_file(file_name: str, data: np.ndarray) -> None:
    with open(file_name, "w") as f:
        for v in data:
            for b in v:
                f.write(f"{b} ")
            f.write("\n")

# main function
def main() -> None:
    parser = argparse.ArgumentParser(prog="Bpm From Arduino")
    parser.add_argument("-p", type=str, help="path to .crd folder")
    args = parser.parse_args()
    print("[INFO] Read data...")
    
    for root, _, files in os.walk(args.p):
        for f in files:
            file_path = os.path.join(root, f)
            if file_path.endswith(".CRD"):
                data_vec = create_data_vec(file_path=file_path)
                print(f"[INFO] Convert {f} data to bit...")
                bpm_to_bit = to_binary(x=data_vec, col=1)
                mag_to_bit = to_binary(x=data_vec, col=0)  
                print(f"[INFO] Write {f} .txt files...")
                txt_name = f.split(".")[0]
                write_data_to_file(file_name=f"{txt_name}-bpm_bit.txt", data=bpm_to_bit)
                write_data_to_file(file_name=f"{txt_name}-mag_bit.txt", data=mag_to_bit)
    
        print("[INFO] Done!")

# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()