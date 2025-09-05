FROM python:3.9-slim

WORKDIR /app

# Install build tools only if needed
RUN apt-get update && apt-get install -y build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]

