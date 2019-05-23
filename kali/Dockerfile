FROM kalilinux/kali-linux-docker

# might be worth installing base-devel

RUN apt-get update 
RUN apt-get upgrade -y
# skm install / general script dependencies
RUN apt-get install -y git gawk gcc g++ curl clang cmake vim
# skm linux install dependencies 
RUN apt-get install -y libpng-dev libcurl4-openssl-dev libsdl2-dev libsdl2-mixer-dev libsdl2-gfx-dev libsdl2-image-dev libsdl2-net-dev libsdl2-ttf-dev libmikmod-dev libncurses5-dev  libbz2-dev libflac-dev libvorbis-dev libwebp-dev libfreetype6-dev 

# Set up SSH / X11 forwarding
RUN apt-get install -y openssh-server xauth x11-xserver-utils x11-apps

RUN echo AddressFamily inet >> /etc/ssh/sshd_config
RUN echo X11Forwarding yes >> /etc/ssh/sshd_config
RUN echo X11DisplayOffset 10 >> /etc/ssh/sshd_config
RUN echo X11UseLocalhost yes >> /etc/ssh/sshd_config
RUN ssh-keygen -A

RUN useradd -m splashkit -p $(openssl passwd -1 kit) -s /bin/bash

# bash <(curl -s https://raw.githubusercontent.com/splashkit/skm/master/install-scripts/skm-install.sh)
RUN git clone https://github.com/rodneyp290/skm --branch enhance/linux-install-script --depth 1 /home/splashkit/.splashkit
RUN chown -R splashkit /home/splashkit/.splashkit

RUN echo 'PATH=~/.splashkit/:$PATH' >> /home/splashkit/.bashrc
RUN chown -R splashkit /home/splashkit/.bashrc

RUN su -c "/home/splashkit/.splashkit/skm linux install" splashkit
RUN su -c "cd /home/splashkit && /home/splashkit/.splashkit/skm new c++" splashkit
COPY program.cpp /home/splashkit/
RUN chown -R splashkit:splashkit /home/splashkit/program.cpp

RUN mkdir /run/sshd
CMD ["/usr/sbin/sshd", "-d"]
