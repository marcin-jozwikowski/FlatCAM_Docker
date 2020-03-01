FROM ubuntu:19.04

ARG USERNAME=flatcam
ARG USERID=1000

ENV DEBIAN_FRONTEND=noninteractive
ENV U_ID=${USERID}
ENV U_NAME=${USERNAME}

RUN apt-get update && apt-get install -y git unzip wget libgl1-mesa-glx libgl1-mesa-dri

RUN wget https://bitbucket.org/jpcgt/flatcam/downloads/FlatCAM_beta_8.991_sources.zip -O Source.zip && \
    unzip Source.zip && \
    mv FlatCAM* flatcam

RUN sed -i 's/sudo //g' /flatcam/setup_ubuntu.sh && \
    sed -i 's/apt install/apt install -y/g' /flatcam/setup_ubuntu.sh && \
    sed -i 's/python3-imaging/python3-pil/g' /flatcam/setup_ubuntu.sh

RUN . /flatcam/setup_ubuntu.sh

RUN useradd -u $U_ID $U_NAME && chown $U_NAME /flatcam -R

CMD python3 /flatcam/FlatCAM.py
