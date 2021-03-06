FROM python:3
LABEL MAINTAINER="anthony@relle.co.uk"

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libusb-1.0-0 \
    python-dev \
    swig \
    curl \
    unzip \
    && curl -L -o /tmp/master.zip https://github.com/happyleavesaoc/python-firetv/archive/master.zip \
    && cd /tmp \
    && unzip master.zip \
    && rm master.zip \
    rm -rf /var/lib/apt/lists/* && \
    pip --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install  flask && \
    pip install /tmp/python-firetv-master[firetv-server]

CMD ["firetv-server", "-c", "config/devices.yaml"]
EXPOSE 5556

# docker build -t docker-firetv .
# docker run -it --rm --name docker-firetv -p 5556:5556 docker-firetv
