# gky360/latexmk-gdrive

FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install --no-install-recommends -y latexmk texlive texlive-latex-extra texlive-lang-japanese

RUN apt-get install --no-install-recommends -y xzdec wget && \
    tlmgr init-usertree && \
    tlmgr option repository ftp://tug.org/historic/systems/texlive/2019/tlnet-final && \
    tlmgr update --self --all && \
    mktexlsr

RUN apt-get install --no-install-recommends -y wget && \
    wget -q -O /usr/local/bin/gdrive https://github.com/gdrive-org/gdrive/releases/download/2.1.0/gdrive-linux-x64 && \
    chmod +x /usr/local/bin/gdrive
