FROM resin/armv7hf-debian:jessie

ENV QEMU_EXECVE 1
COPY . /usr/bin
COPY HelloWorld.java /app/HelloWorld.java
RUN [ "cross-build-start" ]
RUN apt-get update && apt-get install openjdk-7-jdk
WORKDIR /app
RUN javac HelloWorld.java
RUN [ "cross-build-end" ]
