FROM golang AS builder

WORKDIR /build

ADD . /build

RUN bash build.sh

FROM scratch AS runner

WORKDIR /app

COPY --from=builder /build/Music163bot-Go .

CMD [ "./Music163bot-Go" ]
