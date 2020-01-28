FROM ubuntu:18.04
MAINTAINER ngshya
EXPOSE 80
EXPOSE 443
EXPOSE 5000
EXPOSE 8888
EXPOSE 8889
EXPOSE 22
#COPY startup /
#RUN chmod +x /startup
RUN echo "root:root" | chpasswd
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt dist-upgrade -y
RUN apt -y install \
 htop \
 nano \
 git \
 python3-pip \
 wget \
# openssh-server \
 mc
RUN yes | pip3 install --upgrade pip setuptools
RUN yes | pip3 install --user --upgrade \
 pipreqs \
 coverage \
 pytest \
 pytest-cov \
 sphinx \
 flask \
 pandas \
 numpy \
 scipy \
 matplotlib \
 jupyter \
 scikit-learn \
 scikit-image \
 statsmodels \
 tensorflow \
 torch \
 torchvision \
 seaborn \
 plotly \
 pillow \
 pylint \
 spacy \
 bokeh \
 gensim \
 nltk \
 "dask[complete]"\
 tweepy \
 imageio \
 opencv-python \
 pytesseract
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "export PATH=/root/.local/bin/:\$PATH" >> /root/.bashrc 
#ENTRYPOINT /startup
