# PREPARIAMO IL DATASET

import os
import json
import numpy as np
import math
import librosa


PATH_DATASET = "test_ridotto"
SAMPLE_RATE = 22050
DURATION = 30
TOTAL_SAMPLE = SAMPLE_RATE * DURATION

def save_mfcc(path, json_name, n_mfcc=13, n_fft=2048, hop=512, n_segment=5):

    data = { "genere": [], "mfcc": [], "target": [] }

    # Nota: n_segment serve in questo caso perchè lavoreremo con pochi riferimenti, altrimenti sarebbe assai dispendiosa
    sample_per_segment = int(TOTAL_SAMPLE / n_segment)
    mfcc_vectors_per_segmento = math.ceil(sample_per_segment / hop) # numero di vettori coefficienti per ogni segmento

    # navighiamo tra le cartelle per prendere ed analizzare i file che ci interessano
    for i, (dirpath, dirnames, filenames) in enumerate(os.walk(path)):
        if(dirpath is not path):

            # salviamo il genere nel nostro dizionario
            dirpath_genere = dirpath.split("/")
            gen = dirpath_genere[-1]
            data["genere"].append(gen)
            print("\nSto Processando {}".format(gen))

            # analizziamo i file
            for file in filenames:
                file_path = os.path.join(dirpath, file) # join the path che passeremo a librosa load
                check = file_path.split(".") # dovremmo prendere solo quelli con estensione .wav
                # if file_path.endswith(".wav")
                if(check[-1] == "wav"):
                    sig, sr = librosa.load(file_path, sr=SAMPLE_RATE)

                    # analizziamo ogni segmento per ogni file scelto
                    for n in range(n_segment):
                        start = sample_per_segment * n
                        end = start + sample_per_segment

                        # estriamo i coefficienti melcep
                        mfcc = librosa.feature.mfcc(sig[start:end], n_fft=n_fft, hop_length=hop, sr=sr, n_mfcc=n_mfcc)
                        mfcc = mfcc.T # trasponiamo la matrice
                        # print(len(mfcc), mfcc.shape, TOTAL_SAMPLE)

                        if(len(mfcc) == mfcc_vectors_per_segmento): # solo se il numero di vettori è pari a... appendiamo al nostro dataset
                            data["mfcc"].append(mfcc.tolist())
                            data["target"].append(i - 1)
                            print("{}, segmento:{}".format(file_path, n + 1))

    # scriviamo il file .json
    with open(json_name, "w") as fj:
        json.dump(data, fj, indent=5)

save_mfcc(PATH_DATASET, "train_dataset.json")
