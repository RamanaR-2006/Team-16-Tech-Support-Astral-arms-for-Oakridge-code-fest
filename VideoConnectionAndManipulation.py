import cv2
#importing OpenCV(computer vision) library. This library will be crucial to anything related to camera and showing
#the students the details of the experiment

import pyrebase
#firebase is googles cloud databse. i downloaded the Pyrebase4 library on powershell and am gonna use it to
#recognize the instructions stored in the database

config = {
    "apiKey": "AIzaSyAKVwyBbEW538zXDW3jBAaRBepXh7lL3ms",
    "authDomain": "astralarms-a7a8f.firebaseapp.com",
    "projectId": "astralarms-a7a8f",
    "databaseURL": "https://astralarms-a7a8f-default-rtdb.asia-southeast1.firebasedatabase.app/",
    "storageBucket": "astralarms-a7a8f.appspot.com",
    "messagingSenderId": "861360827673",
    "appId": "1:861360827673:web:e25d5e4d2dd9ab2ce86988",
    "measurementId": "G-3Z6E7V8WVX"
}
#information about the astral arms firebase is now stored in the variable config

firebase = pyrebase.initialize_app(config)
#initialize firebase for the library

database = firebase.database()
#initialize the realtime database that stores information about the experiments

cap = cv2.VideoCapture(0)
#using .videocapture with index 1, index 1 referrences external camera. 0 will work on any laptop with inbuilt 
#webcam

while True:
    ret, frame = cap.read()
    #command to capture each frame
    
    cv2.imshow('Webcam', frame)
    #show frame

    if cv2.waitKey(1) == ord('q'):
        break
        #every 1 milisecond, cam records frame
    #killswitch is q


cap.release()
cv2.destroyAllWindows()
#stop camera and code