FROM ubuntu:22.04

# Pre-Run-Section-Added-by-docker-files-updater-v1.26.sh
#ENV HTTP_PROXY http://192.168.1.2:3128
#ENV HTTPS_PROXY http://192.168.1.2:3128
#ENV http_proxy http://192.168.1.2:3128
#ENV https_proxy http://192.168.1.2:3128
#COPY all-v2.27.sh /tmp
#COPY undo-all-v2.27.sh /tmp
#RUN sh /tmp/all-v2.27.sh

# Apt-Update-Revised-by-docker-files-updater-v1.26.sh
RUN apt-get --allow-insecure-repositories update

COPY ./download-pkgs.sh /
RUN chmod +x ./download-pkgs.sh
ENTRYPOINT ["/download-pkgs.sh"]

# Finally-Section-Added-by-docker-files-updater-v1.26.sh
#RUN sh /tmp/undo-all-v2.27.sh
