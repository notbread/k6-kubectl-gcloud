FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:latest

WORKDIR /opt

# Install k6 directly without unnecessary curl and python3
RUN curl -sSL https://github.com/grafana/k6/releases/download/v1.2.2/k6-v1.2.2-linux-amd64.tar.gz -o k6.tar.gz \
    && tar xzf k6.tar.gz \
    && mv k6-v1.2.2-linux-amd64/k6 /usr/local/bin/ \
    && rm k6.tar.gz \
    && rm -rf k6-v1.2.2-linux-amd64 \
    && chmod +x /usr/local/bin/k6
