FROM alpine

RUN apk add --no-cache --virtual scummvm-build-dependencies \
    git \
    build-base \
    sdl2-dev \
    a52dec-dev \
    libjpeg-turbo-dev \
    libmpeg2-dev \
    libogg-dev \
    libvorbis-dev \
    flac-dev \
    libmad-dev \
    libpng-dev \
    libtheora-dev \
    faad2-dev \
    fluidsynth-dev \
    freetype-dev \
    zlib-dev \
    fribidi-dev

ENV SCUMMVM_REVISION v2.2.0
RUN git clone --recursive --branch ${SCUMMVM_REVISION} https://github.com/scummvm/scummvm.git /scummvm

WORKDIR /scummvm

RUN ./configure -prefix=/opt/scummvm
RUN make
RUN make install

