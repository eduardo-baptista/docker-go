FROM golang:1.21.0 as builder

WORKDIR /app

COPY . .
RUN GOOS=linux CGO_ENABLED=0 go build -o cli .

FROM scratch

COPY --from=builder /app/cli .

ENTRYPOINT [ "./cli" ]