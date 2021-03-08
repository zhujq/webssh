FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev curl openssh-server zip unzip net-tools inetutils-ping iproute2 \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && mkdir -p /var/run/sshd \
  && echo 'root:root@1234' |chpasswd && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && mkdir /root/.ssh \
  && rm -rf /var/lib/apt/lists/*

ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["/bin/bash", "run.sh"]
