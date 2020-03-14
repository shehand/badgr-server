# badgr_ubuntu18

FROM ubuntu:18.04
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get upgrade -y
RUN apt-get update -y
RUN apt-get install -y \
    sudo \
    vim \
#
# According to README.md (System-specific requirements(Ubuntu 12.04)
#git, git-core, python-virtualenv, gcc, python-pip, python-devel, libjpeg-turbo, libjpeg-turbo-devel, zlib-devel, mariadb-devel, openldap-devel, cyrus-sasl-devel, swig, libxslt-devel, automake, autoconf, libtool, libffi-devel
    git \
    git-core \
    python-virtualenv \
    gcc python-pip \
    #python-devel \
    python-dev\
    #libjpeg-turbo \
#     libjpeg-turbo \
    #libjpeg-turbo-devel \
     libturbojpeg \
    #zlib-devel \
    zlib1g \ 
    #mariadb-devel \
    #openldap-devel \
    slapd \
    ldap-utils \
    #cyrus-sasl-devel \
    sasl2-bin \
    swig \
    #libxslt-devel \
    libxslt-dev \
    automake \
    autoconf \
    libtool \
    #libffi-devel \
# According to README.md(Prerequisites)
    apt-utils \
    virtualenv \
    libcairo2-dev \
    xmlsec1 \
    mysql-client \
# for anyenv and pyenv 
    make libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl
RUN yes|apt-get install \
        mysql-client \
        python-dev \
#        python3-dev \
        libmysqlclient-dev
RUN  git clone https://github.com/anyenv/anyenv ~/.anyenv \
     && echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile \
     && echo 'eval "$(anyenv init -)"' >> ~/.bash_profile \
     && source ~/.bash_profile \
     && yes y|anyenv install --init \
     && anyenv install pyenv \
     && echo $PATH \
     && source ~/.bash_profile \
     && pyenv install 2.7.14

RUN mkdir /badgr && cd badgr && virtualenv ./env \
     && source env/bin/activate \
     && pip install --upgrade pip \
     && git clone https://github.com/shehand/badgr-server.git code \
     && cd code \
     && pip install -r requirements.txt

RUN  source ~/.bash_profile \
     && anyenv install nodenv \
     && echo 'eval "$(nodenv init -)"' >> ~/.bash_profile \
     && source ~/.bash_profile \
     && echo yarn >> $NODENV_ROOT/default-packages \     
     && nodenv install 8.9.3  \
     && nodenv global 8.9.3  \
     && source ~/.bash_profile \
     && node -v \
     && npm -v \
     && cd /badgr \
     && git clone https://github.com/concentricsky/badgr-ui.git /badgr/badgr-ui \
     && cd /badgr/badgr-ui \
     && source ~/.bash_profile \
     && node -v \
     && echo 'wait a minuite...' \
     && npm i npm@latest -g \
     && npm install
