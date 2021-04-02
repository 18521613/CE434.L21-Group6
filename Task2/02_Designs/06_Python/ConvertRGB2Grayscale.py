import cv2
  
image = cv2.imread('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/RGB_Resized.png')
img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
cv2.imwrite('/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/01_Image/RGB2GRAY.png', gray)   
cv2.destroyAllWindows()