# import section
import cv2 as cv
import mediapipe as mp

# ref mediapipe: https://github.com/google-ai-edge/mediapipe

# main scripts

mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles
mp_hands = mp.solutions.hands

# main function
def main() -> None:
    cap = cv.VideoCapture(0)
    
    with mp_hands.Hands(max_num_hands=2, model_complexity=0, min_detection_confidence=0.5, min_tracking_confidence=0.5) as hands:
        while True:
            check, frame = cap.read()
            
            if check:
                frame = cv.flip(frame, 1)
                check_hands = hands.process(frame)
                if check_hands.multi_hand_landmarks:
                    # print(len(check_hands.multi_hand_landmarks))
                    for hand_landmarks in check_hands.multi_hand_landmarks:
                        pos = hand_landmarks.landmark[8]
                        x = int(pos.x * cap.get(cv.CAP_PROP_FRAME_WIDTH))
                        y = int(pos.y * cap.get(cv.CAP_PROP_FRAME_HEIGHT))
                        cv.circle(frame, (x, y), 30, (0, 0, 255), -1)
                            # mp_drawing.draw_landmarks(
                            #     frame,
                            #     hand_landmarks,
                            #     mp_hands.HAND_CONNECTIONS,
                            #     mp_drawing_styles.get_default_hand_landmarks_style(),
                            #     mp_drawing_styles.get_default_hand_connections_style()
                            # )
                cv.imshow("frame", frame)
                if cv.waitKey(1) == ord('q'):
                    print("[INFO] Out by user!")
                    break;
                
    cap.release()
    cv.destroyAllWindows()
    



# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()
