FROM fedora

# might be worth installing base-devel

RUN dnf update -y
RUN dnf upgrade -y
# skm install / general script dependencies
RUN dnf group install -y "Development Tools"
RUN dnf install -y git gawk gcc curl clang vim sudo

# Required at splashkit app run time 
RUN dnf install -y mesa-dri-drivers

# Set up SSH / X11 forwarding
RUN dnf install -y openssh-server xorg-x11-xauth xorg-x11-utils xorg-x11-apps

RUN echo AddressFamily inet >> /etc/ssh/sshd_config
RUN echo X11Forwarding yes >> /etc/ssh/sshd_config
RUN echo X11DisplayOffset 10 >> /etc/ssh/sshd_config
RUN echo X11UseLocalhost yes >> /etc/ssh/sshd_config
RUN ssh-keygen -A


RUN useradd -m splashkit -p $(openssl passwd -1 kit) -s /bin/bash
RUN groupadd sudo
RUN usermod -aG sudo splashkit
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# bash <(curl -s https://raw.githubusercontent.com/splashkit/skm/master/install-scripts/skm-install.sh)
RUN git clone https://github.com/rodneyp290/skm --branch enhance/linux-install-script --depth 1 /home/splashkit/.splashkit
RUN chown -R splashkit /home/splashkit/.splashkit

RUN echo 'export PATH=~/.splashkit/:$PATH' >> /home/splashkit/.bashrc
RUN chown -R splashkit /home/splashkit/.bashrc

RUN su -c "cd /home/splashkit && /home/splashkit/.splashkit/skm new c++" splashkit
COPY program.cpp /home/splashkit
COPY install-n-test.sh /home/splashkit/
RUN chown splashkit /home/splashkit/program.cpp
RUN chown splashkit /home/splashkit/install-n-test.sh
RUN chmod +x /home/splashkit/install-n-test.sh

RUN mkdir /run/sshd
CMD ["/usr/sbin/sshd", "-d"]
