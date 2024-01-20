import cv2

#importing OpenCV(computer vision) library. This library will be crucial to anything related to camera and showing
#the students the details of the experiment

import numpy as np
#numpy for arrays (for images technically)

import socket
import pickle
import struct
#uploading to web

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
ip = "127.0.0.1"
port = 6666
s.bind((ip, port))
while True:
    x = s.recvfrom(1000000)
    clientip = x[1][0]

    data = pickle.loads(data)

    frame = cv2.imdecode(data, cv2.IMREAD_COLOR)

    cv2.imshow('Img Server', frame)

    if cv2.waitKey(25) == ord('q'):
        break
        #every 1 milisecond, cam records frame
    #killswitch is q
cv2.destroyAllWindows()