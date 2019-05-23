FROM archlinux/base


# skm install / general script dependencies
RUN pacman -Syu --noconfirm 
RUN pacman -S --noconfirm --needed git gawk which gcc clang cmake libpng sdl2 base-devel
# skm linux install dependencies 
RUN pacman -S --noconfirm --needed libpng sdl2 sdl2_mixer sdl2_gfx sdl2_image sdl2_net sdl2_ttf libmikmod

# Set up SSH / X11 forwarding
RUN pacman -S --noconfirm --needed openssh xorg-xauth xorg-xhost xorg-xeyes

RUN echo AddressFamily inet >> /etc/ssh/sshd_config
RUN echo X11Forwarding yes >> /etc/ssh/sshd_config
RUN echo X11DisplayOffset 10 >> /etc/ssh/sshd_config
RUN echo X11UseLocalhost yes >> /etc/ssh/sshd_config
RUN ssh-keygen -A

RUN useradd -m splashkit -p $(openssl passwd -1 kit)

# bash <(curl -s https://raw.githubusercontent.com/splashkit/skm/master/install-scripts/skm-install.sh)
RUN git clone https://github.com/rodneyp290/skm --branch enhance/linux-install-script --depth 1 /home/splashkit/.splashkit
RUN chown -R splashkit:splashkit /home/splashkit/.splashkit

RUN echo 'PATH=~/.splashkit/:$PATH' >> /home/splashkit/.bashrc
RUN chown -R splashkit:splashkit /home/splashkit/.bashrc

RUN su -c "/home/splashkit/.splashkit/skm linux install" splashkit
RUN su -c "cd /home/splashkit && /home/splashkit/.splashkit/skm new c++" splashkit
COPY program.cpp /home/splashkit/
RUN chown -R splashkit:splashkit /home/splashkit/program.cpp

CMD ["/bin/sshd", "-d"]
