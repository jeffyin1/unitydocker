#https://hub.docker.com/r/gableroux/unity3d/tags
#--- search from tag
ARG BASE_GABLEROUX_DOCKER=gableroux/unity3d:2018.4.20f1-android

FROM ${BASE_GABLEROUX_DOCKER}


ARG COMPONENTS="iOS"
#--- select version you want by this url. Paste url to DOWNLOAD_URL
#https://gitlab.com/gableroux/unity3d/-/blob/master/ci-generator/unity_versions.old.yml
ARG DOWNLOAD_URL=https://beta.unity3d.com/download/008688490035/UnitySetup-2018.4.20f1 
ARG SHA1=2c303d964744bc75c0571da63ae417a8ed7b33a1 

RUN wget -nv ${DOWNLOAD_URL} -O UnitySetup && \
    if [ -n "${SHA1}" -a "${SHA1}" != "" ]; then \
    echo "${SHA1}  UnitySetup" | sha1sum --check -; \
    else \
    echo "no sha1 given, skipping checksum"; \
    fi && \
    chmod +x UnitySetup &&     echo y |     ./UnitySetup     --unattended     --install-location=/opt/Unity     --verbose     --download-location=/tmp/unity     --components=$COMPONENTS &&     rm UnitySetup &&     rm -rf /tmp/unity &&     rm -rf /root/.local/share/Trash/*

#Register
ARG UNITY_SERIAL=
ARG UNITY_USERNAME=
ARG UNITY_PASSWORD=

#copy default package manifest.json to docker
ADD ./manifest.json /opt/Unity/Editor/Data/Packages/manifest.json

#register unity
RUN xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -logFile -batchmode -serial ${UNITY_SERIAL} -username ${UNITY_USERNAME} -password ${UNITY_PASSWORD} -nographics -quit -silent-crashes 

#--- set custom install
RUN apt-get update -y && apt-get install git-lfs -y