import cv2 
import numpy as np
from numpy.core.numeric import binary_repr

image = cv2.imread('Image.jfif') 
# BGR -> RGB 
img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB) 
# Write data
cv2.imwrite('RGB.png', img)  
print (img)

# resize image
scale_percent = 50
width = int(img.shape[1] * scale_percent / 100)
height = int(img.shape[0] * scale_percent / 100)
dim = (width, height)
# resize image
img = cv2.resize(img, dim, interpolation = cv2.INTER_AREA)
cv2.imwrite('RGB_Resized.png', img)
print('Resized Dimensions : ',img.shape)
cv2.imshow("Resized image", img) 
cv2.waitKey(0)
# Convert channel 
img_transpose = img.transpose(2, 0, 1)
print(img_transpose.shape)
print(img_transpose)
# Revert 3d to 2d full data
img_reshaped = img_transpose.reshape(img_transpose.shape[0], -1)
print(img_reshaped.shape)
print(img_reshaped)
# Convert Decimal to Binary with width size 8
# binary_repr_v = np.vectorize(lambda i: '{0:08b}'.format(i))
binary_repr_v = np.vectorize(np.binary_repr)
# abc = binary_repr_v(img_reshaped, width=8)
# print(abc)
abc = binary_repr_v(img_reshaped,8)
print(type(abc))
print(abc)
# np.savetxt('koala_binary.txt',)
np.savetxt("data.txt", abc, delimiter=" ", newline = "\n", fmt="%s")
print("Save done")