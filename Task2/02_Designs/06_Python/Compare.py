import cv2
import numpy as np
""" Calculate the error between the original equation and shift equation """
gray_img = cv2.imread('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/GrayscalefromBinary.png', cv2.IMREAD_UNCHANGED)
rgb_img = cv2.imread('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/RGB2GRAY.png', cv2.IMREAD_UNCHANGED)
python_output = rgb_img[:, :, 0] * 0.281 + rgb_img[:, :, 1] * 0.562 + rgb_img[:, :, 2] * 0.093
error = np.absolute(gray_img.astype('float32') - python_output) / python_output
error = error.mean()
print('Error: {:.6f}%'.format(error * 100))
