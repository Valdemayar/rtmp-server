PHONY: all
all:
	go build -v -o server_demo .
	./server_demo

local-docker:
	docker-compose build
	docker-compose up

upload-container:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 303029436715.dkr.ecr.us-east-1.amazonaws.com
	docker build -t rtmp_server .
	docker tag rtmp_server:latest 303029436715.dkr.ecr.us-east-1.amazonaws.com/rtmp_server:latest
	docker push 303029436715.dkr.ecr.us-east-1.amazonaws.com/rtmp_server:latest