FROM alpine:latest AS builder
RUN apk add --no-cache \
	boost-dev \
	asio-dev \
	curl \
	make \
	g++

WORKDIR /app
COPY . .
RUN make

FROM alpine:latest AS runtime
RUN apk add --no-cache \
	boost-dev \
	asio-dev \
	curl
WORKDIR /app /app
COPY --from=builder /app /app
EXPOSE 8000
CMD [ "./setup-dotfiles" ]
