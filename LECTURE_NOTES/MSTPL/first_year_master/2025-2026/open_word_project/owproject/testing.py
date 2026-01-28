from PIL import Image
from transformers import BlipProcessor, BlipForConditionalGeneration

PROCESSOR = BlipProcessor.from_pretrained("Salesforce/blip-image-captioning-base")
MODEL = BlipForConditionalGeneration.from_pretrained("Salesforce/blip-image-captioning-base")

PATH_TO_TEST_IMAGE = "/Users/pm/AcaHub/Coding/EducaLectures/Seminario_StochasticComposition/images/download.jpg"

def main():
    image = Image.open(PATH_TO_TEST_IMAGE).convert("RGB")
    prompt = ""
    inputs = PROCESSOR(images=image, return_tensors="pt")
    outputs = MODEL.generate(**inputs)

    description = PROCESSOR.decode(outputs[0], skip_special_tokens=True)

    print(description)

if __name__ == "__main__":
    main()
