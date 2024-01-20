import cv2
import numpy as np
import socket
import pickle
from flask import Flask, Response, render_template

app = Flask(__name__)

testube_cascade = cv2.CascadeClassifier("cascade4.xml")
cap = cv2.VideoCapture(0)

def generate_frames():
    while True:
        ret, frame = cap.read()
        if not ret:
            break
        else:
            ret, buffer = cv2.imencode('.jpg',frame)
            frame=buffer.tobytes()
            #Convert the frame to grayscale for cascade detection
            #noColorImage = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

            # Cascade detection for test tubes
            #testubes = testube_cascade.detectMultiScale(noColorImage, 1.10, 3)

            # Draw rectangles around detected test tubes
            #for (x, y, w, h) in testubes:
                #frame = cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)

            
            # Serialize the frame and yield it to the response
            #frame = frame.tobytes()
            yield (b'--frame\r\n'
                b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')
        
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/video')
def video():
    return Response(generate_frames(),mimetype='multipart/x-mixed-replace; boundary=frame')


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)



