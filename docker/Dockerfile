# Use Ubuntu 22.04 as base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/games/:$PATH"
ENV STEAM_DIR="/home/steam/Steam/steamapps/common"
ENV PAL_SERVER_DIR="${STEAM_DIR}/PalServer"
ENV STEAMWORKS_DIR="${STEAM_DIR}/steamworks"
ENV SDK64_DIR="/home/steam/.steam/sdk64"
ENV STEAM_USER="steam"
ENV GAME_PORT="8211"
ENV CON_PORT="25575"

# Install necessary packages
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y software-properties-common lib32gcc-s1 && \
    add-apt-repository multiverse && \
    apt-get update -y && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    apt-get install -y steamcmd cron curl &&\
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create steam user
RUN useradd -m ${STEAM_USER}

# Switch to steam user
USER ${STEAM_USER}

# Install steamworks
RUN steamcmd +force_install_dir "${STEAMWORKS_DIR}" +login anonymous +app_update 1007 +quit

# Install PalServer
RUN steamcmd +force_install_dir "${PAL_SERVER_DIR}" +login anonymous +app_update 2394010 validate +quit

# Copy steamclient.so to the necessary directory
RUN mkdir -p ${SDK64_DIR} && \
    cp "${STEAMWORKS_DIR}/linux64/steamclient.so" ${SDK64_DIR}/

# Add cron job
RUN (crontab -l 2>/dev/null; echo "0 * * * * steamcmd +force_install_dir \"${PAL_SERVER_DIR}\" +login anonymous +app_update 2394010 validate +quit") | crontab -

# Expose necessary port
EXPOSE ${GAME_PORT}/udp
EXPOSE ${CON_PORT}/tcp

# Start PalServer
CMD ["/home/steam/Steam/steamapps/common/PalServer/PalServer.sh"]
