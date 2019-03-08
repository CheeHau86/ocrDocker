FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update
RUN apt-get install python-pip python-dev -y
RUN pip install virtualenv
RUN apt-get install python-opencv -y
RUN apt-get install tesseract-ocr -y
RUN apt-get update
RUN virtualenv saeocrenv
CMD ["source", "saeocrenv/bin/activate"]
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
RUN pip install tensorflow
ADD ./ /code/
EXPOSE 8088
CMD ["python", "manage.py", "runserver", "0.0.0.0:8088"]
