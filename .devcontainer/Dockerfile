FROM milkvtech/milkv-duo:latest

ARG DEBIAN_FRONTEND=nointeractive
ARG CONTAINER_USER=mvduo
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $CONTAINER_USER \
    && useradd --uid $USER_UID --gid $USER_GID -m $CONTAINER_USER \
    && chown -R $USER_UID:$USER_GID /home/$CONTAINER_USER \
    && usermod -a -G dialout $CONTAINER_USER \

    && apt-get update \
    && apt-get install -y sudo \
    && echo $CONTAINER_USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$CONTAINER_USER \
    && chmod 0440 /etc/sudoers.d/$CONTAINER_USER

# install docker
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io

# Create a docker group and add your user
RUN if getent group docker > /dev/null 2>&1; then \
        echo "Docker group exists"; \
    else \
        groupadd docker; \
    fi && \
    usermod -aG docker $CONTAINER_USER

RUN apt-get update && apt-get upgrade -y

RUN curl -O https://raw.githubusercontent.com/milkv-duo/duo-examples/main/envsetup.sh \
    && chmod +x envsetup.sh \
    && ./envsetup.sh

RUN mv envsetup.sh /home/${CONTAINER_USER}/.envsetup.sh \
    && echo "source ~/.envsetup.sh" >> /home/${CONTAINER_USER}/.bashrc

USER ${CONTAINER_USER}
ENV USER=${CONTAINER_USER}
WORKDIR /home/${CONTAINER_USER}

CMD ["/bin/bash", "-c"]
