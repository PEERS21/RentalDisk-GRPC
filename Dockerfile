FROM python:3.11-slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends git ca-certificates && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app

COPY . .
RUN git clone https://github.com/PEERS21/Common-python.git /app/common

RUN pip install --upgrade pip setuptools wheel \
 && pip install --no-cache-dir -r common/requirements.txt -r grpc/requirements.txt \
 && pip uninstall -y redis || true \
 && pip install --no-cache-dir "redis==7.2.0"

EXPOSE 50051

CMD ["python", "-m", "grpc.server"]
