FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:latest

WORKDIR /opt

RUN apt-get update \
    && apt-get install -y curl python3 \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/ \
    && curl -sSL https://github.com/grafana/k6/releases/download/v0.57.0/k6-v0.57.0-linux-amd64.tar.gz -o k6.tar.gz \
    && tar xzf k6.tar.gz \
    && mv k6-v0.57.0-linux-amd64/k6 /usr/local/bin/ \
    && rm k6.tar.gz \
    && rm -rf k6-v0.57.0-linux-amd64 \
    && chmod +x /usr/local/bin/k6 \
    && apt-get remove -y curl \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
