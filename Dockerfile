FROM debian 


LABEL maintainer="Marius Stoica <Letto2@gmail.com>"
LABEL version="0.0.1"
LABEL Description="Dockerfile for python programming."


RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -qq update && apt-get -qq dist-upgrade \
    && apt-get install -qq --no-install-recommends python3 python3-venv \
    && unset -v DEBIAN_FRONTEND

RUN python3 -m venv /root/helloenv/
RUN echo "source /root/helloenv/bin/activate" >> /root/.bashrc

ADD .env /root/helloenv/
ADD hello.py /root/helloenv/

RUN /root/helloenv/bin/pip install -v python-dotenv 

CMD /bin/bash
