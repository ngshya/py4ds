FROM ubuntu:18.04
MAINTAINER ngshya
COPY startup-py /
RUN chmod +x /startup-py
RUN echo "root:root" | chpasswd
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt dist-upgrade -y
RUN apt -y install htop \
 nano \
 git \
 python3-pip \
 wget \
 openssh-server
RUN yes | pip3 install --upgrade pip
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
ENTRYPOINT /startup-py
