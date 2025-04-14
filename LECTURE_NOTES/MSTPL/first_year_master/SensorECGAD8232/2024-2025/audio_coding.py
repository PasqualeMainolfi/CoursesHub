# import section
import pyaudio as pa
import numpy as np

# main scripts

"""
2^8 = 0 - 255 int -> 2^7 - 1 <= data <= 2^7 - 1

|---------||--------||--------|
 1000 1111  [0]0000000  [0]0000000
  Msb Lsb     Pitch      Vel
"""

CHUNK = 1024
FS = 44100
N_CHANNELS = 1

# main function
def main() -> None:
    p = pa.PyAudio()

    print("[SYSTEM INFO]")
    for dev in range(p.get_device_count()):
        device = p.get_device_info_by_index(device_index=dev)
        print(f"[{dev}]: {device["name"]}")
        print(device)
    
    index_device_in = int(input("INSERISCI L'INDICE DEL DEVICE IN: "))
    index_device_out = int(input("INSERISCI L'INDICE DEL DEVICE OUT: "))
            
    stream = p.open(
        format=pa.paFloat32,
        rate=FS,
        frames_per_buffer=CHUNK,
        input=True,
        output=True,
        input_device_index=index_device_in,
        output_device_index=index_device_out,
        channels=N_CHANNELS
    )
    
    stream.start_stream()
    
    while True:
        try:
            frame = stream.read(num_frames=CHUNK, exception_on_overflow=True)
            decoded = np.frombuffer(frame, dtype=np.float32)
            
            # ... -> DSP
            
            encoded = decoded.tobytes()
            stream.write(encoded)
        except KeyboardInterrupt:
            print("DONE!")
            break
    
    stream.stop_stream()
    stream.close()
    p.terminate()
    
            
        
        
    
    



# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()