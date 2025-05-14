# import section
import pyaudio as pa
import numpy as np
import wave
import pygame

# main scripts

"""
2^8 = 0 - 255 int -> 2^7 - 1 <= data <= 2^7 - 1

|---------||--------||--------|
 1000 1111  [0]0000000  [0]0000000
  Msb Lsb     Pitch      Vel
"""

CHUNK = 512
FS = 44100
N_CHANNELS = 1

PATH = "/Users/pm/AcaHub/AudioSamples/suzanne_mono.wav"

pygame.init()

# main function
def main() -> None:
     
    pygame.display.set_caption('Spectrum Analyzer')
    screen = pygame.display.set_mode((1280, 760))
    
    
    p = pa.PyAudio()

    print("[SYSTEM INFO]")
    for dev in range(p.get_device_count()):
        device = p.get_device_info_by_index(device_index=dev)
        print(f"[{dev}]: {device["name"]}")
        print(device)
    
    index_device_in = int(input("INSERISCI L'INDICE DEL DEVICE IN: "))
    index_device_out = int(input("INSERISCI L'INDICE DEL DEVICE OUT: "))
    
    audio_file = wave.open(PATH, "r")
            
    stream = p.open(
        format=pa.get_format_from_width(audio_file.getsampwidth()),
        rate=audio_file.getframerate(),
        frames_per_buffer=CHUNK,
        input=False,
        output=True,
        input_device_index=index_device_in,
        output_device_index=index_device_out,
        channels=audio_file.getnchannels()
    )
    
    stream.start_stream()
    
    while True:
        try:
            
            screen.fill("white")
            
            # frame = stream.read(num_frames=CHUNK, exception_on_overflow=True)
            frame = audio_file.readframes(CHUNK)
            decoded = np.frombuffer(frame, dtype=np.int16) / 32768.0
            
            fft = np.fft.rfft(decoded)
            mag = np.abs(fft)
            
            step = screen.get_width() / fft.size
            for i, m in enumerate(mag):
                value = screen.get_height() - m * 100
                pygame.draw.circle(screen, (0, 0, 0), pygame.Vector2(i * step, value), 3)
                pygame.draw.line(screen, (0, 0, 0), pygame.Vector2(i * step, screen.get_height()), pygame.Vector2(i * step, value))
                
            # ... -> DSP
            
            stream.write(frame)
            
            pygame.display.flip()
        except KeyboardInterrupt:
            print("DONE!")
            break
    
    stream.stop_stream()
    stream.close()
    p.terminate()
    audio_file.close()
    

# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()