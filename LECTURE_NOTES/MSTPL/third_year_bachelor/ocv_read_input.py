# import section
import cv2 as cv


# main scripts
IMG_PATH = 'cat.jpg'
VIDEO_PATH = 'coffe.mp4'


# main function
def main() -> None:
    img = cv.imread(IMG_PATH) # read image
    video = cv.VideoCapture(VIDEO_PATH)
    
    print('[INFO] Press any key to close image...\n')
    cv.imshow("Cat 1", img)
    # cv.waitKey(0)
    
    while True:
        
        ret, frame = video.read()
        
        if not ret:
            break
        
        cv.imshow("Coffe", frame)
        
        if cv.waitKey(int(1000 / 25)) & 0xFF == ord('q'):
            break
    
    video.release()
    cv.destroyAllWindows()


# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()