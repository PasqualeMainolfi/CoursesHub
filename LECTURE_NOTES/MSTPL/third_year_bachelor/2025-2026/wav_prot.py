"""
[Master RIFF chunk]
   FileTypeBlocID  (4 bytes) : Identifier « RIFF »  (0x52, 0x49, 0x46, 0x46)
   FileSize        (4 bytes) : Overall file size minus 8 bytes
   FileFormatID    (4 bytes) : Format = « WAVE »  (0x57, 0x41, 0x56, 0x45)

[Chunk describing the data format]
   FormatBlocID    (4 bytes) : Identifier « fmt␣ »  (0x66, 0x6D, 0x74, 0x20)
   BlocSize        (4 bytes) : Chunk size minus 8 bytes, which is 16 bytes here  (0x10)
   AudioFormat     (2 bytes) : Audio format (1: PCM integer, 3: IEEE 754 float)
   NbrChannels     (2 bytes) : Number of channels
   Frequency       (4 bytes) : Sample rate (in hertz)
   BytePerSec      (4 bytes) : Number of bytes to read per second (Frequency * BytePerBloc).
   BytePerBloc     (2 bytes) : Number of bytes per block (NbrChannels * BitsPerSample / 8).
   BitsPerSample   (2 bytes) : Number of bits per sample

[Chunk containing the sampled data]
   DataBlocID      (4 bytes) : Identifier « data »  (0x64, 0x61, 0x74, 0x61)
   DataSize        (4 bytes) : SampledData size
   SampledData
"""

import math

DURATION = 3
NCHNLS = 1
BIT_DEPTH = 16
SR = 44100

HEADER_SIZE = 44

BYTE_PER_BLOCK = int(NCHNLS * BIT_DEPTH / 8)
BYTE_PER_SECOND = int(SR * BYTE_PER_BLOCK)
AUDIO_DATA_SIZE = BYTE_PER_SECOND * DURATION
FULL_DATA_SIZE = AUDIO_DATA_SIZE + HEADER_SIZE

FILE_BLOCK_ID = b"RIFF"
FILE_SIZE = (FULL_DATA_SIZE - 8).to_bytes(4, "little")
FORMAT_WAVE = b"WAVE"

FORMAT_BLOCK_ID = b"fmt "
BLOCK_SIZE = (16).to_bytes(4, "little")
FORMAT = (1).to_bytes(2, "little")
NCHNLS = (NCHNLS).to_bytes(2, "little")
SR = (SR).to_bytes(4, "little")
BYTE_PER_SECOND = (BYTE_PER_SECOND).to_bytes(4, "little")
BYTE_PER_BLOCK = (BYTE_PER_BLOCK).to_bytes(2, "little")
BITS_PER_SAMPLE = (BIT_DEPTH).to_bytes(2, "little")

DATA_BLOCK_ID = b"data"
DATA_SIZE = (AUDIO_DATA_SIZE).to_bytes(4, "little")


with open("test.wav", 'wb') as f:
    f.write(FILE_BLOCK_ID)
    f.write(FILE_SIZE)
    f.write(FORMAT_WAVE)

    f.write(FORMAT_BLOCK_ID)
    f.write(BLOCK_SIZE)
    f.write(FORMAT)
    f.write(NCHNLS)
    f.write(SR)
    f.write(BYTE_PER_SECOND)
    f.write(BYTE_PER_BLOCK)
    f.write(BITS_PER_SAMPLE)

    f.write(DATA_BLOCK_ID)
    f.write(DATA_SIZE)

    for i in range(AUDIO_DATA_SIZE):
        y = 0.707 * math.sin(2 * math.pi * 440 * i / 44100)
        y_int = int(2 ** (BIT_DEPTH - 1) * y).to_bytes(2, "little", signed=True)
        f.write(y_int)
