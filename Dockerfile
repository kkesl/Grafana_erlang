FROM erlang:latest

COPY ./promtail/config.yml /etc/promtail/config.yml
COPY ./promtail/promtail.service /etc/systemd/system/promtail.service

RUN curl -fSL -o promtail.gz "https://github.com/grafana/loki/releases/download/v1.6.1/promtail-linux-amd64.zip"
RUN gunzip promtail.gz
RUN chmod a+x promtail
RUN useradd --system promtail

ENTRYPOINT ["./promtail"]
