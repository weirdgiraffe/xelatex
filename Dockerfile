FROM debian:8
MAINTAINER weirdgiraffe <giraffe@cyberzoo.xyz>

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update \
    && apt-get install -y perl wget python

COPY texlive.profile /

ENV PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH \
    INFOPATH=/usr/local/texlive/2016/texmf-dist/doc/info \
    MANPATH=/usr/local/texlive/2016/texmf-dist/doc/man

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar xzf install-tl-unx.tar.gz 

RUN cd install-tl-*/ \
    && ./install-tl -profile /texlive.profile
RUN tlmgr install texliveonfly \
    && rm -rf  /insttall-tl-*

RUN echo "deb http://httpredir.debian.org/debian jessie main contrib non-free" > /etc/apt/sources.list \
    && echo "deb http://httpredir.debian.org/debian jessie-updates main contrib non-free" >> /etc/apt/sources.list \
    && echo "deb http://security.debian.org jessie/updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y fontconfig make ttf-anonymous-pro ttf-mscorefonts-installer \
    && apt-get clean

WORKDIR /sources
ENTRYPOINT ["bash"]
