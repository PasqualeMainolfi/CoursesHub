from transformers import AutoModel, AutoImageProcessor
from PIL import Image
import cv2 as cv

PROCESSOR = AutoImageProcessor.from_pretrained('facebook/dinov2-base')
MODEL = AutoModel.from_pretrained('facebook/dinov2-base')


def main():
    cap = cv.VideoCapture(2)

    while True:
        ret, frame = cap.read()
        if ret:
            frame = cv.cvtColor(frame, cv.COLOR_BGR2RGB)
            inputs = PROCESSOR(images=frame, return_tensors="pt")
            outputs = MODEL(**inputs)
            last_hidden_states = outputs.last_hidden_state.detach().numpy()
            vector = last_hidden_states.reshape(last_hidden_states.shape[1], last_hidden_states.shape[2])
            print(vector[0, :10])

        key = cv.waitKey(30) & 0xFF
        if key == 27:
            break

    cv.destroyAllWindows()
    cap.release()

if __name__ == "__main__":
    main()
