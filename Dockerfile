FROM python:3.7
ENV PYTHONUNBUFFERED 1
RUN apt-get update
RUN apt-get install python-pip3 python-dev -y
RUN pip install virtualenv
RUN apt-get update
RUN virtualenv saeocrenv
CMD ["source", "saeocrenv/bin/activate"]
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install --no-cache-dir tensorflow-gpu==1.4
RUN pip install -r requirements.txt
ADD ./ /code/
EXPOSE 8088
CMD ["python", "manage.py", "runserver", "0.0.0.0:8088"]
