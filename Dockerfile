FROM        ubuntu:18.04
MAINTAINER  jay.jaeyoung@gmail.com

# Package Update
RUN apt -y update
RUN apt -y dist-upgrade

# Install Git, Vim, Pip
RUN apt -y install git vim python-pip

# Pyenv
RUN apt -y install make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
ENV PATH /root/.pyenv/bin:$PATH
RUN echo 'export PATH="/root/.pyenv/bin:$PATH"' >> ~/.zshrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.zshrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

# Zsh
RUN apt-get install -y zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN chsh -s /usr/bin/zsh

# Virtual Environment
RUN pyenv install 3.7.4
RUN pyenv virtualenv 3.7.4 django_world

# Gunicorn
RUN pip install gunicorn


