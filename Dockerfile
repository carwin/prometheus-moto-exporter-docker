FROM golang:1.18

WORKDIR /usr/src/app

RUN git clone https://github.com/jahkeup/prometheus-moto-exporter
WORKDIR prometheus-moto-exporter
RUN pwd; ls -aln;
RUN go build -v -o /usr/local/bin/app ./cmd/prometheus-moto-exporter
WORKDIR /usr/src/app
RUN echo $PATH
RUN pwd; ls -aln /usr/local/bin/app

RUN /usr/local/bin/app -v

# CMD ["/usr/local/bin/app --password brisketwowtown6 --username admin"]

CMD ["app","--bind=0.0.0.0:9731"]

EXPOSE 9731
