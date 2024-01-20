import cv2

#importing OpenCV(computer vision) library. This library will be crucial to anything related to camera and showing
#the students the details of the experiment

import numpy as np
#numpy for arrays (for images technically)

import firebase_admin
from firebase_admin import credentials, firestore
# Initialize Firebase Admin SDK with the service account key

cred = credentials.Certificate("astralarms-a7a8f-firebase-adminsdk-sltkf-88a9f35d08.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
# Access9ollo9 Firestore

ref = db.collection('Experiments')

#collection stores information in a firestore database

testube_cascade = cv2.CascadeClassifier("cascade.xml")
#trained a haar cascade model for 26 minutes to detect test-tubesq

cap = cv2.VideoCapture("Science Minute - Rainbow Test Tubes.mp4")
#using .videocapture with index 1, index 1 referrences external camera. 0 will work on any laptop with inbuilt 
#webcam

while True:
    ret, frame = cap.read()
    #command to capture each frame

    noColorImage = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    #the image but gray

    testubes = testube_cascade.detectMultiScale(noColorImage,1.01,7)
    #using haar cascade to recognize the pic for testube

    for (x,y,w,h) in testubes:
        frame = cv2.rectangle(frame,(x,y),(x+w,y+h),(255,0,0),2) 
    #put rectangle around test-tube
    
    cv2.imshow('Webcam', frame)
    #show frame



    if cv2.waitKey(25) == ord('q'):
        break
        #every 1 milisecond, cam records frame
    #killswitch is q


cap.release()
cv2.destroyAllWindows()
#stop camera and code