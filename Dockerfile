FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update
RUN apt-get install python3-pip -y
RUN apt-get install python-pip python-dev nginx git -y
RUN pip3 install virtualenv
RUN virtualenv saeocrenv
RUN apt-get install python3-opencv -y
CMD ["source", "saeocrenv/bin/activate"]
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
RUN apt install tesseract-ocr -y
RUN apt-get update
COPY ./ /code/
RUN ls -la /code/*/*
EXPOSE 8088
CMD ["python", "manage.py", "runserver", "0.0.0.0:8088"]
