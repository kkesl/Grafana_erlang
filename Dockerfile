FROM erlang:latest


RUN git clone https://github.com/davisp/jiffy.git
RUN git clone https://github.com/aronisstav/ejsonlog.git
WORKDIR /ejsonlog
RUN git pull
RUN wget https://s3.amazonaws.com/rebar3/rebar3 && chmod +x rebar3
COPY ./promtail/config.yml /etc/promtail/config.yml
RUN curl -fSL -o promtail.gz "https://github.com/grafana/loki/releases/download/v1.6.1/promtail-linux-amd64.zip"
RUN gunzip promtail.gz
RUN chmod a+x promtail
RUN useradd --system promtail
COPY ./test_script.sh .
RUN chmod a+x test_script.sh


ENTRYPOINT ["./test_script.sh"]
