# app/Dockerfile

FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    gnupg \
    lsb-release \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mohammadakeeb0011/Olympics_Analysis_App.git

RUN pip3 install -r ./Olympics_Analysis_App/requirements.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "./Olympics_Analysis_App/app.py", "--server.port=8501", "--server.address=0.0.0.0"]
