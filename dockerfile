# FROM ubuntu:20.04
# 
# WORKDIR /app
# 
# RUN apt update && apt install -y \
# 	build-essential \
# 	libboost-all-dev \
# 	&& rm -rf /var/lib/apt/lists/*
# 
# COPY . .
# 
# RUN make
# EXPOSE 8080
# 
# CMD [ "./setup-dotfiles" ]
FROM arm64v8/alpine:latest

RUN apk app --no-cache \
	build-base \
	boost-dev \
	make \
	gcc g++

WORKDIR /app

COPY . .

RUN make

EXPOSE 8080

CMD [ "./setup-dotfiles" ]