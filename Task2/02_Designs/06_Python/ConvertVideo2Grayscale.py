# importing the module
import cv2
import numpy as np
from numpy.core.numeric import binary_repr
import os

def convert_image2binary (img):
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB) 

    # Choose precent size image
    width = int(img.shape[1])
    height = int(img.shape[0])
    dim = (width, height)
    print(width, height)

    # Resize image
    img = cv2.resize(img, dim, interpolation = cv2.INTER_AREA)

    # Convert channel 
    img_transpose = img.transpose(2, 0, 1)

    # Revert 3d to 2d full data
    img_reshaped = img_transpose.reshape(img_transpose.shape[0], -1)

    # Convert Decimal to Binary with width size 8
    binary_repr_v = np.vectorize(np.binary_repr)
    abc = binary_repr_v(img_reshaped,8)

    # Save
    np.savetxt("/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/03_Python/data.txt", abc, delimiter=" ", newline = "\n", fmt="%s")


def convert_binary2video ():
    array=[]
    f = open('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/02_Modelsim/write_mem.txt','r')
    for i in f:
        array.append(i)
    f.close()

    # Remove /n
    array = list(map(lambda s: s.strip(),array))
    #Choose pixel Image

    width, height =(int(img.shape[0]),int(img.shape[1]))
    print(width, height)

    # Tao mang de save sau cung ve mang 2 chieu
    binary_array = []
    address = 0 
    for i in range(width):
        # tao mang tam thoi de ket hop thanh mang 2 chieu
        temporary = []
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

    return binary_array
    # reading the vedio


if __name__=="__main__":
    print('Enter number of frames:')
    x = int(input())
    print('-------------Begining------------------')
    source = cv2.VideoCapture('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/04_Input/video.mp4')
    
    # running the loop
    os.system('vlog /home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/02_IP_core/02-Hdl/RGB2GRAYSCALE_2.v /home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/02_IP_core/03-Testbench/Lab2_tb.v')
    y = -2 
    # for i in range(x):
    for i in range(x):
    
        # extracting the frames
        ret, img = source.read()
        
        # Generate rgb binary
        convert_image2binary(img)

        # Run ModelSim
        
        os.system('vsim -c -do "run -all" Lab2_tb')
    
        # Read gray binary
        abc = convert_binary2video()

        # Write to output video
        y = y + 1
        cv2.imwrite('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/abc'+ str(y + 1) +'.png',abc)

# closing the window
source.release()
cv2.destroyAllWindows()

# Concate frames to Video
os.system("ffmpeg -f image2 -r 30 -i /home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/abc%1d.png -vcodec mpeg4 -y /home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/output_2.mp4")
