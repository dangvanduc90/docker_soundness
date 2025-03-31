FROM ubuntu:latest
#FROM ubuntu:24.04
RUN apt update && apt upgrade -y
# Install nginx, php-fpm and supervisord from ubuntu repository
RUN apt install -y nginx php-fpm supervisor

RUN apt install build-essential pkg-config libssl-dev curl -y
RUN curl -sSL https://raw.githubusercontent.com/soundnesslabs/soundness-layer/main/soundnessup/install | bash
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs/ | sh -s -- -y
RUN apt install -y git vim
SHELL ["/bin/bash", "-c", "source ~/.bashrc"]

#RUN soundnessup install
#RUN soundnessup update
#RUN soundness-cli generate-key --name my-key
#RUN soundness-cli export-key --name my-key