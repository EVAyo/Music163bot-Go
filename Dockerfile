FROM golang as builder

WORKDIR /build

ADD . /build

RUN go mod tidy

RUN bash build.sh

FROM scratch as runner

WORKDIR /app

COPY --from=builder /build/Music163bot-Go .

CMD [ "./Music163bot-Go" ]
