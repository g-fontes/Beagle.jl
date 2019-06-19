FROM julia:1.0

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    vim \
    tmux \
    wget \
    unzip \
    cmake \
    && apt-get clean

COPY deps.jl deps.jl

RUN julia deps.jl

COPY hello /hello

WORKDIR /hello

EXPOSE 8000

CMD ["bin/server"]
