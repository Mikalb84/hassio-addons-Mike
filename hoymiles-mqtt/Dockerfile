FROM python:3.11-slim

# 1. Installation de la dépendance
RUN pip install --no-cache-dir hoymiles-mqtt

# 2. Création et définition du dossier de travail
WORKDIR /data
RUN mkdir -p /app

# 3. Copie du script dans le dossier de travail
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

# 4. Exécution
CMD [ "/app/run.sh" ]
