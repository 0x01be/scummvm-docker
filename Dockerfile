FROM alpine

RUN apk add --no-cache --virtual scummvm-build-dependencies \
    git \
    build-base \
    clang-dev \
    gtk+3.0-dev \
    libx11-dev

RUN apk add --no-cache --virtual scummvm-edge-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    sdl2-dev \
    sdl2_net-dev \
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
    curl-dev \
    libieee1284-dev \
    sndio-dev \
    readline-dev \
    fribidi-dev

ENV SCUMMVM_REVISION v2.2.0
RUN git clone --recursive --branch ${SCUMMVM_REVISION} https://github.com/scummvm/scummvm.git /scummvm

WORKDIR /scummvm

#ENV CXX clang++
#ENV CFLAGGS "$CFLAGS -U_FORTIFY_SOURCE"
#ENV CXXFLAGS "$CXXFLAGS -U_FORTIFY_SOURCE"

RUN ./configure \
    --prefix=/opt/scummvm \
    --enable-all-engines
#RUN make
#RUN make install

