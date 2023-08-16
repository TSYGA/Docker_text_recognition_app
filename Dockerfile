FROM ubuntu:latest
RUN apt-get update -qy

RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -qy python3.9 python3-pip

RUN pip install flask
RUN pip install easyocr
RUN pip install --no-deps pillow==9.5.0

RUN wget https://github.com/JaidedAI/EasyOCR/releases/download/v1.3/english_g2.zip
RUN wget https://github.com/JaidedAI/EasyOCR/releases/download/v1.6.1/cyrillic_g2.zip
RUN wget https://github.com/JaidedAI/EasyOCR/releases/download/pre-v1.1.6/craft_mlt_25k.zip

RUN mkdir ~/.EasyOCR
RUN mkdir ~/.EasyOCR/model

RUN unzip english_g2.zip -d ~/.EasyOCR/model
RUN unzip cyrillic_g2.zip -d ~/.EasyOCR/model
RUN unzip craft_mlt_25k.zip -d ~/.EasyOCR/model

RUN mkdir /app
COPY recognition.py /app

WORKDIR /app
EXPOSE 5000
CMD ["python3","recognition.py"]
