FROM python:3.11-slim

# Installation de jq et de la dépendance python
RUN apt-get update && apt-get install -y jq && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir hoymiles-mqtt

# Création du dossier de travail
WORKDIR /data
RUN mkdir -p /app

# Copie et préparation du script
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD [ "/app/run.sh" ]
