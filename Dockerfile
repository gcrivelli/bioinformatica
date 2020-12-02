FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Argentina/Buenos_Aires

RUN apt-get update \
    && apt-get install -y tzdata \
        make \
        gcc \
        build-essential \
        gcc-multilib \
        apt-utils \
        perl \
        expat \
        libexpat1-dev \
        bioperl \
        clustalo \
        emboss

RUN cpan Bio::Tools::Run::RemoteBlast

COPY Ejercicios /opt/Ejercicios/
WORKDIR /opt/Ejercicios/

EXPOSE 80

CMD tail -f /dev/null