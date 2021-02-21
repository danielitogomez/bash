.PHONY: help build run all

IMAGE_NAME = cidr2netmask

help:
	@echo 'Use make build for build the image'
	@echo 'Use make run for run the container'
	@echo 'Use make all for make 3 before steps'

build:
	docker build -t ${IMAGE_NAME} .

run:
	docker run ${IMAGE_NAME} $(arg1)

all:
	docker build -t ${IMAGE_NAME} .
	docker run ${IMAGE_NAME} $(arg1)
