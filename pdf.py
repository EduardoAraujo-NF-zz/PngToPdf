import os
import img2pdf

filename = "pdfFull.pdf"

try:
    with open(filename, "wb") as f:
        f.write(img2pdf.convert([i for i in os.listdir(os.getcwd()) if i.endswith(".png") or i.endswith(".jpg")]))
    print("sucesso")
except:
    print("fail")