FROM nvidia/cuda:10.0-cudnn7-runtime

LABEL author="Gabriel Wu"

ENV UNAME gabriel

ENV HOME /home/${UNAME}

RUN apt-get update && \
  apt-get install -y \
  gdal-bin \
  libgdal-dev \
  libsm6 \
  libxext6 \
  libxrender1 \
  python3 \
  python3-pip \
  python3-gdal \
  sudo

RUN pip3 install \
  bokeh \
  fastai \
  jupyter \
  jupyter_contrib_nbextensions \
  keras \
  notebook \
  opencv-python \
  plotnine \
  prosail \
  salib \
  scikit-image \
  scikit-learn \
  tensorflow-gpu \
  torch \
  torchvision

RUN jupyter contrib nbextension install

RUN export UNAME=${UNAME} UID=1000 GID=1000 && \
    mkdir -p "/home/${UNAME}" && \
    echo "${UNAME}:x:${UID}:${GID}:${UNAME} User,,,:/home/${UNAME}:/bin/bash" >> /etc/passwd && \
    echo "${UNAME}:x:${UID}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d && \
    echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UNAME} && \
    chmod 0440 /etc/sudoers.d/${UNAME} && \
    chown ${UID}:${GID} -R /home/${UNAME} && \
    gpasswd -a ${UNAME} audio

USER ${UNAME}

WORKDIR ${HOME}

COPY entrypoint.sh entrypoint.sh

COPY config.py config.py

COPY mycert.pem mycert.pem

RUN sudo chmod +x entrypoint.sh

EXPOSE 8888

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]