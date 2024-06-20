FROM python:3.8.19-slim
LABEL org.opencontainers.image.authors="tomi@rekavisitama.net"

# Set environment variables.
ENV PYTHONUNBUFFERED=1

# Update software.
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y wget procps \
     && wget -O /usr/bin/jq  https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-linux-arm64 \
     && chmod +x /usr/bin/jq 
RUN python -m pip install --upgrade pip \
     && rm -rf /var/lib/apt/lists/* \
     && apt-get clean
     


# Create the folder where the devpi data (e.g. the indices) are saved.
RUN mkdir -p /devpi

# Set the current working directory inside the container.
WORKDIR /devpi

# Copy files into /devpi.
COPY requirements.txt .

# Install devpi & dependencies.
RUN pip install -r requirements.txt

# Add entrypoint
COPY devpi-client /usr/local/bin/
COPY entrypoint.sh /
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
EXPOSE 3141