#!/bin/sh
#use sh to hide password log
docker build . \
            --build-arg UNITY_SERIAL=${UNITY_SERIAL} \
            --build-arg UNITY_USERNAME=${UNITY_USERNAME} \
            --build-arg UNITY_PASSWORD=${UNITY_PASSWORD} \
            --build-arg BASE_GABLEROUX_DOCKER=${BASE_GABLEROUX_DOCKER} \
            --build-arg DOWNLOAD_URL=${DOWNLOAD_URL} \
            -t ${DOCKER_FULLNAME}