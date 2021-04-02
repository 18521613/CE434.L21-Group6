import cv2
import numpy as np
  
if __name__=="__main__":
    print('Enter number of frames:')
    x = int(input())
    print('-------------Begining------------------')
    source = cv2.VideoCapture('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/04_Input/video.mp4')
    
    # running the loop
    # for i in range(x):
    for i in range(x):
    
        # extracting the frames
        ret, img = source.read()
        
        # Generate rgb binary
        """ Calculate the error between the original equation and shift equation """
        gray_img = cv2.imread('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/abc'+ str(i) + '.png', cv2.IMREAD_UNCHANGED)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        python_output = img[:, :, 0] * 0.281 + img[:, :, 1] * 0.562 + img[:, :, 2] * 0.093
        error = np.absolute(gray_img.astype('float32') - python_output) / python_output
        error = error.mean()
        print('Error: {:.6f}%'.format(error * 100))
    
        # Write to output video

# closing the window
source.release()
cv2.destroyAllWindows()