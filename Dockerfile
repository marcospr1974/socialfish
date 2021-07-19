FROM ubuntu:focal

LABEL software="socialfish" \
      vendor="Marcos Pablo Russo" \
      email="marcospr1974@gmail.com" \
      com.example.version="3.0" \
      com.example.release-date="2021-07-15"

ARG TZ="UTC"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
 && echo $TZ > /etc/timezone \
 && apt update \
 && apt install build-essential git python3-dev python3-pip libxml2 -y \
 && git clone https://github.com/UndeadSec/SocialFish.git \
 && cd SocialFish \
 && pip3 install -r requirements.txt \
 && chmod +x SocialFish.py \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /SocialFish

ENTRYPOINT ["./SocialFish.py","admin","debian"]
