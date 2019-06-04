#this is for AWS EC2 ubuntu server 18.04
#connect to ubuntu server

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
$ sudo apt-get update
$ sudo apt-get install -y docker-ce
$ sudo usermod -aG docker ${USER}
$ sudo apt-get install git
$ git clone https://github.com/CheeHau86/ocrDocker.git 
$ sudo apt-get install tesseract-ocr -y
$ sudo apt-get update

#log out and log in again to take effect
#the model file is 370+Mb, unable to upload to github. we need to manually upload into server 
#the model file is share in google drive https://drive.google.com/drive/u/0/folders/17PW5L1QGKhc_kC7Vq6VimDIXD0UXcTnb

$ scp -i "siva1.pem" localDesktopLocation/model.ckpt-150491.data-00000-of-00001 ubuntu@ipAddress:/home/ubuntu/ocrDocker/models/model_150ksteps/

$ cd ocrDocker 
$ sudo apt-get update
$ docker build -t ocr-docker:0.0.1 .
$ docker run -p 8088:8088 ocr-docker:0.0.1
