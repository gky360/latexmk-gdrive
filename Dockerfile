# gky360/latexmk-gdrive

FROM golang:1.15

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install --no-install-recommends -y latexmk texlive texlive-full

RUN apt-get install --no-install-recommends -y xzdec wget && \
    tlmgr init-usertree && \
    tlmgr option repository ftp://tug.org/historic/systems/texlive/2018/tlnet-final && \
    tlmgr update --self --all && \
    mktexlsr

RUN go get github.com/prasmussen/gdrive
