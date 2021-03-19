import numpy as np
import cv2

array=[]
f = open('write_mem.txt','r')
for i in f:
    array.append(i)
f.close()
""" print('Array') 
print(array)
print('Type Array') 
print(type(array)) """

# xoa cac phan tu /n do file doc
array = list(map(lambda s: s.strip(),array))
""" print('Array') 
print(array) """
#####################################################
img = cv2.imread('RGB_Resized.png') 
pixel = img.shape
width, height =(pixel[0],pixel[1])
# print (width,height)
#####################################################
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
            address = j + 1 + address # su dung bien tam de luu cac dia chi tiep theo can tach
    # add mang 1 chieu vao
    binary_array.append(temporary)

""" print('Binary_array')
print(binary_array)
print('Type binary_array') 
print(type(binary_array)) """
# Convert list to np.array
binary_array = np.array(binary_array)
""" print('Type Result_binary') 
print(type(binary_array)) """

cv2.imwrite('GrayscaleimagefromBinary.png',binary_array)
cv2.imread('GrayscaleimagefromBinary.png',cv2.IMREAD_GRAYSCALE)
cv2.waitKey(0)
cv2.destroyAllWindows()
print('~DONE~')
