import cv2
#importing OpenCV(computer vision) library

#using .videocapture with index 1, index 1 referrences external camera
cap = cv2.VideoCapture(1)

while True:
    ret, frame = cap.read()
    
    #command to capture each frame
    cv2.imshow('Webcam', frame)


    #every 1 milisecond, cam records frame
    #killswitch is q
    if cv2.waitKey(1) == ord('q'):
        break

#stop camera and code
cap.release()
cv2.destroyAllWindows()