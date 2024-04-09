# Use bedtools as the base image
FROM ubuntu:24.04

MAINTAINER Julian Menendez, jmmenend@ucsc.edu

# install python and numpy
RUN apt-get update && \
	apt-get install -y python3.12 && \
	apt-get install -y python3-numpy

# install viterbi HMM python file
WORKDIR /opt/
# Copy your shell script
COPY scripts/viterbi_cdr.sh .
# Copy your python to .
COPY scripts/HMMCDRReferenceDetection.v5.py .
# Make the script executable
RUN chmod +x ./viterbi_cdr.sh

ENV PATH=/opt:$PATH

WORKDIR /data