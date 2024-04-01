FROM debian:bookworm
RUN adduser --disabled-password --gecos '' maciej
RUN adduser maciej sudo

RUN apt-get update -y && \
    apt-get install git sudo curl git gnupg -y
RUN echo "maciej ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/maciej

USER maciej:maciej
WORKDIR /home/maciej

RUN mkdir .configs && chown maciej:maciej .configs
COPY --chown=maciej:maciej . .configs/dev

RUN cd .configs/dev && ./configinstall

ENTRYPOINT ["/bin/zsh"]
