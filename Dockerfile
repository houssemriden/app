 FROM ubuntu 
 # Update apt cache
 COPY . /data 
 RUN apt-get -y update
 # Install ansible dependencies
 RUN apt-get install -y git python3 curl python3-pip && pip install --upgrade pip
RUN curl  https://bootstrap.pypa.io/pip/3.4/get-pip.py -o get-pip.py && python3 get-pip.py --user &&  python3 -m pip install --user ansible
RUN echo export PATH=$PATH:$HOME/.local/bin > ~/.bashrc 
EXPOSE 80
#RUN ansible-playbook /data/tomcat_deploy.yml
 # Clone ansible repo (could also add the ansible PPA and do an apt-get install instead)
WORKDIR /data
RUN chmod +x  tomcat_test.sh
CMD ["/bin/bash","-c","./tomcat_test.sh PROD"]

 # Run ansible using the site.yml playbook 
 #RUN ansible-playbook /data/tomcat_deploy.yml -c local

