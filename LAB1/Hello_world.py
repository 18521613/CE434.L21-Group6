# import pakages
import cv2
import numpy as np

# read from webcam or read video #Ex: cap = cv2.VideoCapture(outVideo.avi) 
cap = cv2.VideoCapture(0) 

# get the frame
# default is 640x480
frame_width = int(cap.get(3))
frame_height = int(cap.get(4))
print((frame_width, frame_height))\

# define video codec code
# example: XVID, MJPG, X264, ...
fourcc = cv2.VideoWriter_fourcc(*'XVID')

# Create VideoWriter with file's name, codec code, fps, frame size
out = cv2.VideoWriter('outVideo.avi', fourcc, 20.0, (frame_width, frame_height))
print('Press button q to exit.')

while cap.isOpened():
    # rcapture frame by frame
    _, frame = cap.read()

    # flip frameq
    flip_frame = cv2.flip(frame, 1)

    # write the video
    out.write(flip_frame)

    # display the frame
    cv2.imshow('Video Stream', frame)
    
    # wait until button q is pressed
    if (cv2.waitKey(10) & 0xff) == ord('q'):
        break

# Realease when DONE
cap.release()
out.release()
cv2.destroyAllWindows()
