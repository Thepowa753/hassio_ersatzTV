FROM ghcr.io/ersatztv/ersatztv:latest

# Installa jq e i pacchetti per la lingua (locales)
RUN apt-get update \
    && apt-get install -y --no-install-recommends jq locales \
    && rm -rf /var/lib/apt/lists/*

# Genera e imposta il locale en_US.UTF-8 per risolvere i decimali in FFmpeg
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT []
CMD ["/run.sh"]
