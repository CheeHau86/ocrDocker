FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install python-pip python-dev nginx -y
RUN pip3 install virtualenv
RUN apt-get update
RUN virtualenv saeocrenv
RUN apt-get install python-opencv -y
CMD ["source", "saeocrenv/bin/activate"]
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
RUN apt-get install tesseract-ocr -y
RUN apt-get update
ADD ./ /code/
EXPOSE 8088
CMD ["python", "manage.py", "runserver", "0.0.0.0:8088"]
