FROM ghcr.io/ersatztv/ersatztv:latest

# Installa jq e il pacchetto delle lingue (locales)
RUN apt-get update \
    && apt-get install -y --no-install-recommends jq locales \
    && rm -rf /var/lib/apt/lists/*

# Abilita l'inglese americano e lo compila nel sistema
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

# Imposta le variabili d'ambiente direttamente a livello di immagine
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT []
CMD ["/run.sh"]
