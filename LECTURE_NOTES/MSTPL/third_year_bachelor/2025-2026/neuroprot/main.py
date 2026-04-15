from decoder import ProtEncoder

AUDIO_PATH = "audio_test/vox.wav"

def main():
    pe = ProtEncoder()
    package = pe.encode(audio_path=AUDIO_PATH)
    with open("pack", "bw") as f:
        f.write(package)


if __name__ == "__main__":
    main()
