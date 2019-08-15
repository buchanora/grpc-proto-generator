FROM node:6.6
ENV GRPC_NODE_VERSION 1.0.0

# Make sure you grab the latest version
RUN apt-get update && apt-get install unzip && \
    curl -OL https://github.com/google/protobuf/releases/download/v3.9.1/protoc-3.9.1-linux-x86_64.zip
RUN unzip protoc-3.9.1-linux-x86_64.zip -d protoc3 && \
    mv protoc3/bin/* /usr/local/bin/ && \
    mv protoc3/include/* /usr/local/include/ && \
    ln -s /usr/local/bin/protoc /usr/bin/protoc

RUN apt-get install -yq \
    sudo 

ARG user=proto
ARG user_pass=pass123
ENV USER=$user

RUN adduser --disabled-password --gecos "" $USER && \
    sudo usermod -a -G sudo $USER && \
    echo "$USER:${user_pass}" | chpasswd && \
    echo "${USER}  ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers.d/$USER

ENV USER_HOME=/home/$USER
ENV NPM_CONFIG_PREFIX=$USER_HOME/.npm-global
ENV PATH=$PATH:$USER_HOME/.npm-global/bin

USER $USER

# Optional: change owner
RUN sudo chown $USER /usr/local/bin/protoc && \
    sudo chown -R $USER /usr/local/include/google

RUN npm install -g grpc
RUN npm install -g grpc-tools

WORKDIR /app/protos

VOLUME [ "/app" ]

ENTRYPOINT [ "/app/scripts/entrypoint.sh" ]