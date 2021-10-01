FROM ubuntu:focal

RUN apt-get update && apt-get install -y nuget mono-devel mono-xbuild git
RUN apt update
RUN nuget update -self

RUN echo steam steam/question select "I AGREE" | debconf-set-selections && echo steam steam/license note '' | debconf-set-selections && dpkg --add-architecture i386 && apt-get -q -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends lib32gcc1 steamcmd 

RUN mkdir /se
RUN cd /se && /usr/games/steamcmd +login anonymous +@sSteamCmdForcePlatformType windows +force_install_dir /se +app_update 298740 +quit

RUN mkdir -p /plugin
RUN ln -s /se/DedicatedServer64 /plugin/lib 

COPY entrypoint.sh /
CMD /entrypoint.sh
