FROM ubuntu:22.04

ARG ARCH=x86_64
ARG WKHTMLTOPDF_VERSION=0.12.6
ENV DEBIAN_FRONTEND=noninteractive

# 安装依赖
RUN apt-get update && \
    apt-get install -y \
      build-essential git python3 python3-pip \
      qtbase5-dev qtchooser libqt5webkit5-dev \
      libx11-dev libxext-dev libxrender-dev libfontconfig1-dev \
      cmake pkg-config wget xz-utils bzip2 sudo unzip && \
    rm -rf /var/lib/apt/lists/*

# 下载 wkhtmltopdf 源码
RUN git clone --branch ${WKHTMLTOPDF_VERSION} --depth 1 https://github.com/wkhtmltopdf/wkhtmltopdf.git /wkhtmltopdf

WORKDIR /wkhtmltopdf
