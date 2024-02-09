docker build -t palworld .
docker run -p 8211:8211/udp -p 25575:25575/tcp --name palworld palworld
