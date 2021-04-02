import os
# Run RGB2Binary.py to convert RGB Image to Binary txt file
os.system('python3 /home/tmt/CE434_L21_Group6/WEEK_3/ConvertRGB2Binary.py')
# Convert Binary to Decimal and display result
os.system('python3 /home/tmt/CE434_L21_Group6/WEEK_3/ConvertBinary2Grayscale.py')
# Convert image by cv2
os.system('python3 /home/tmt/CE434_L21_Group6/WEEK_3/ConvertRGB2Grayscale.py')
# Compare 2 image
os.system('python3 /home/tmt/CE434_L21_Group6/WEEK_3/Compare.py')

# os.system('vlog /home/tmt/CE434_L21_Group6/WEEK_3/RGB2GRAYSCALE_2.v /home/tmt/CE434_L21_Group6/WEEK_3/Lab2_tb.v')
# os.system('vsim -do "do wave.do; run -all" Lab2_tb')