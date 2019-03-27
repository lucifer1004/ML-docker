FROM nvidia/cuda:10.0-cudnn7-runtime

RUN apt-get update && \
  apt-get install -y \
  gdal-bin \
  libgdal-dev \
  libsm6 \
  libxext6 \
  libxrender1 \
  python3 \
  python3-pip \
  python3-gdal

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

WORKDIR /home

COPY entrypoint.sh entrypoint.sh

COPY config.py config.py

COPY mycert.pem mycert.pem

RUN chmod +x entrypoint.sh

EXPOSE 8888

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]