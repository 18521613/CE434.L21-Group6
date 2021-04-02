import numpy as np
import cv2

array=[]
f = open('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/02_Modelsim/write_mem.txt','r')
for i in f:
    array.append(i)
f.close()

# Remove /n
array = list(map(lambda s: s.strip(),array))
#Choose pixel Image
img = cv2.imread('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/RGB_Resized.png') 
pixel = img.shape
width, height =(pixel[0],pixel[1])


# Tao mang de save sau cung ve mang 2 chieu
binary_array = []
address = 0 
for i in range(width):
    # tao mang tam thoi de ket hop thanh mang 2 chieu
    temporary = [];
    for j in range(height):
        temporary.append(int(array[j + address],2))
        if j != (height - 1):
            continue
        else:
            address = j + 1 + address # Su dung bien tam de luu cac dia chi tiep theo can tach
    # Add mang 1 chieu vao
    binary_array.append(temporary)
# Convert list to np.array
binary_array = np.array(binary_array)

cv2.imwrite('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/GrayscalefromBinary.png',binary_array)
cv2.imread('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/GrayscalefromBinary.png',cv2.IMREAD_UNCHANGED)

print('~DONE~')
