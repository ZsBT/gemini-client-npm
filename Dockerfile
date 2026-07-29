FROM ubuntu

RUN apt update
RUN apt -y install npm procps
RUN npm install -g @google/gemini-cli
RUN apt clean

USER ubuntu

HEALTHCHECK --interval=30s --timeout=3s CMD pidof node || exit 1

WORKDIR /workspace

ENTRYPOINT [ "/usr/local/bin/gemini" ]

LABEL org.opencontainers.image.title="gemini-cli"
LABEL org.opencontainers.image.description="npm-based Gemini command line client"
LABEL org.opencontainers.image.vendor="ZsBT"
LABEL org.opencontainers.image.url="https://github.com/ZsBT/gemini-client-npm"
# docker build -t gemini .
# docker run -it -v $PWD/workspace:/workspace -v $PWD/settings:/home/ubuntu/.gemini gemini

