FROM python:3.11-slim

WORKDIR /app

COPY . .
RUN pip install --no-cache-dir -r grpc/requirements.txt
RUN pip install --no-cache-dir -r common/requirements.txt

EXPOSE 50051

CMD ["python", "-m", "grpc/server"]