#this is for AWS EC2 ubuntu server 18.04
#connect to ubuntu server

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
$ sudo apt-get update
$ sudo apt-get install -y docker-ce
$ sudo usermod -aG docker ${USER}
$ sudo apt-get install git

#log out and log in again to take effect

$ git clone https://github.com/CheeHau86/saeOcrDjango && cd saeOcrDjango 
$ docker build -t ocr-docker:0.0.1 .
$ docker run -p 8088:8088 ocr-docker:0.0.1
