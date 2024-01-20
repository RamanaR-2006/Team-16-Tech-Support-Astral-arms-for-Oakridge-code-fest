import cv2

#importing OpenCV(computer vision) library. This library will be crucial to anything related to camera and showing
#the students the details of the experiment

import numpy as np
#numpy for arrays (for images technically)

import firebase_admin
from firebase_admin import credentials, firestore
# Initialize Firebase Admin SDK with the service account key

import tkinter as tk
from tkinter import scrolledtext
# GUI


testube_cascade = cv2.CascadeClassifier("cascade3.xml")
#trained a haar cascade model for 26 minutes to detect test-tubesq

cap = cv2.VideoCapture("sciencevid.mp4")
#using .videocapture with index 1, index 1 referrences external camera. 0 will work on any laptop with inbuilt 
#webcam

while True:
    ret, frame = cap.read()
    #command to capture each frame

    noColorImage = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    #the image but gray

    testubes = testube_cascade.detectMultiScale(noColorImage,1.01,7)
    #using haar cascade to recognize the pic for testube. the 2nd num is scale factor, and the third is min neighnours

    for (x,y,w,h) in testubes:
        if w > 30 and h > 30:
            #make sure the picture is big enough
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