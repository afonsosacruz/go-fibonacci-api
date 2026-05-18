# Stage 1, build da aplicação
FROM golang:1.24 AS builder

WORKDIR /app

COPY go.mod ./
COPY *.go ./

RUN go build -o main .

# Stage 2, imagem final mais leve
FROM debian:bookworm-slim

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]
