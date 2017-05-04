FROM debian:wheezy

RUN apt-get update
RUN apt-get install -y openssh-server openjdk-7-jre-headless
RUN useradd -m -s /bin/bash jenkins
RUN echo jenkins:jenkins | chpasswd
RUN mkdir -p /var/run/sshd
EXPOSE 22
CMD /usr/sbin/sshd -D
