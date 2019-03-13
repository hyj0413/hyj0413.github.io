FROM node:6.2.2

# make app directory
RUN mkdir -p /app

# set a directory where commands like RUN, CMD, ENTRYPOINT would excecute in the docker image
WORKDIR /app

# add files in current directory to /app which exists in the docker image
ADD . /app

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i ko_KR -c -f UTF-8 -A /usr/share/locale/locale.alias ko_KR.UTF-8
ENV LANG ko_KR.utf8

# port number to expose
EXPOSE 3000 80

# exceeute logbackup script when container starts without shell
CMD ["npm", "start"]