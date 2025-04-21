FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates tzdata && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir psycopg2-binary requests
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY poller.py .

ENTRYPOINT ["python", "/app/poller.py"]
