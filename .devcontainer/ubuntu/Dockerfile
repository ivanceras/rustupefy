FROM ubuntu

RUN apt-get update && apt-get install sudo

RUN echo "user:user" | chpasswd
RUN usermod -aG sudo user
RUN mkdir -p /home/user/ubuntu
WORKDIR /home/user
ADD ubuntu /home/user/ubuntu
CMD ["/bin/bash"]