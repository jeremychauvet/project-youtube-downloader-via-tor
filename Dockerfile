FROM ubuntu:latest

RUN apt-get update && \
  # Install Tor.
  apt-get install software-properties-common python tor curl tmux nload -y && \
  echo ControlPort 9051 > /etc/tor/torr && \
  echo CookieAuthentication 0 > /etc/tor/torr && \
  /etc/init.d/tor restart && \
  # Install Youtube DL.
  curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
  chmod a+rx /usr/local/bin/youtube-dl

CMD [ "/etc/init.d/tor", "start" ]
