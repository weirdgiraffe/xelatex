FROM debian:8
MAINTAINER weirdgiraffe <giraffe@cyberzoo.xyz>

COPY texlive.profile /

ENV DEBIAN_FRONTEND=noninteractive \
    PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH \
    INFOPATH=/usr/local/texlive/2016/texmf-dist/doc/info \
    MANPATH=/usr/local/texlive/2016/texmf-dist/doc/man

RUN apt-get update \
    && apt-get install -y perl wget python \
    && apt-get clean \
    && wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar xzf install-tl-unx.tar.gz \
    && cd install-tl-*/ \
    && ./install-tl --profile=texlive.profile \
    && tlmgr update --self \
    && tlmgr install texliveonfly \
    && cd / \
    && rm -rf texlive.profile \
    && rm -rf install-tl-*

WORKDIR /sources
ENTRYPOINT ["bash"]
