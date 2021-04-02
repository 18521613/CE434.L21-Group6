import cv2 
import numpy as np
from numpy.core.numeric import binary_repr
import os

image = cv2.imread('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/04_Input/Image.jpg') 
# BGR -> RGB 
img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB) 
print ('Shape Original image : ',img.shape)
# Choose precent size image
scale_percent = 50
width = int(img.shape[1] * scale_percent / 100)
height = int(img.shape[0] * scale_percent / 100)
dim = (width, height)
# Resize image
img = cv2.resize(img, dim, interpolation = cv2.INTER_AREA)
cv2.imwrite('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/RGB_Resized.png', img)
print('Resized Dimensions : ',img.shape)

# Convert channel 
img_transpose = img.transpose(2, 0, 1)
print('Convert position : ',img_transpose.shape)

# Revert 3d to 2d full data
img_reshaped = img_transpose.reshape(img_transpose.shape[0], -1)
print('Convert Channel RGB with pixels',img_reshaped.shape)
print(img_reshaped)

# Convert Decimal to Binary with width size 8
binary_repr_v = np.vectorize(np.binary_repr)
abc = binary_repr_v(img_reshaped,8)
print('Type RESULT_NEED',type(abc))
print(abc)
#Save
np.savetxt("/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/03_Python/data.txt", abc, delimiter=" ", newline = "\n", fmt="%s")
print("SAVE DONE")