# DISEGNIAMO LA NOSTRA RETE PER LA CLASSIFICAZIONE

import json
import numpy as np
from sklearn.model_selection import train_test_split
import tensorflow.keras as keras
import matplotlib.pyplot as plt

DATASET_PATH = "train_dataset.json"

# carichiamo il dataset (da cambiare con lettura .h5)
def carica_dataset(path):
    with open(path, "r") as f:
        data = json.load(f)

    # convertiamo la lista in numpy array
    inputs = np.array(data["mfcc"]) # array inputs
    target = np.array(data["target"]) # array target

    return(inputs, target, data)

inputs, target, data = carica_dataset(DATASET_PATH)
# print(inputs, target)

# splittiamo in train e test dataset
x_train, x_test, y_train, y_test = train_test_split(inputs, target, test_size=0.25)


def show_net(net_story):
    fig, ax = plt.subplots(2)

    ax[0].plot(net_story.history["accuracy"], label="train accuracy")
    ax[0].plot(net_story.history["val_accuracy"], label="test accuracy")
    ax[0].set_ylabel("ACCURACY")
    ax[0].legend()

    ax[1].plot(net_story.history["loss"], label="train error")
    ax[1].plot(net_story.history["val_loss"], label="test error")
    ax[1].set_ylabel("ERROR")
    ax[1].legend()

    plt.show()


print(inputs.shape[1], inputs.shape[2])

# costruiamo la nostra rete
model = keras.Sequential([
    # input layer
    keras.layers.Flatten(input_shape=(inputs.shape[1], inputs.shape[2])),
    # 1st layer
    keras.layers.Dense(512, activation="relu", kernel_regularizer=keras.regularizers.l2(0.0001)),
    keras.layers.Dropout(0.21), # risolviamo l'overfitting
    # 2st layer
    keras.layers.Dense(256, activation="relu", kernel_regularizer=keras.regularizers.l2(0.0001)),
    keras.layers.Dropout(0.21),
    # 3st layer
    keras.layers.Dense(64, activation="relu", kernel_regularizer=keras.regularizers.l2(0.0001)),
    keras.layers.Dropout(0.21),
    # output
    keras.layers.Dense(10, activation="softmax")
])

# compiliamo la nostra rete
ottimizzazione = keras.optimizers.Adam(learning_rate=0.0001)
model.compile(ottimizzazione, loss="sparse_categorical_crossentropy", metrics=["accuracy"])
model.summary()

# alleniamo la nostra rete
net_story = model.fit(x_train, y_train, validation_data=(x_test, y_test), epochs=1000, batch_size=32)
show_net(net_story)


# facciamo una predizione
print()
# test_loss, test_accuracy = model.evaluate(x_test, y_test)
predictions = model.predict(x_test)
# print(predictions.shape, predictions[0], np.argmax(predictions[0]))
print("il valore atteso è {}".format(data["genere"][y_test[0]]))
print("la predizione è {}".format(data["genere"][np.argmax(predictions[0])]))
