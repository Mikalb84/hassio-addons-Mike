#!/usr/bin/env bash
set -e

echo "Starting Hoymiles-MQTT add-on..."

# Récupération des options depuis le fichier de config interne de Home Assistant
CONFIG_PATH=/data/options.json

MQTT_HOST=$(jq --raw-output '.mqtt_host' $CONFIG_PATH)
MQTT_PORT=$(jq --raw-output '.mqtt_port' $CONFIG_PATH)
MQTT_USER=$(jq --raw-output '.mqtt_user' $CONFIG_PATH)
MQTT_PASS=$(jq --raw-output '.mqtt_pass' $CONFIG_PATH)
DTU_HOST=$(jq --raw-output '.dtu_host' $CONFIG_PATH)
DTU_PORT=$(jq --raw-output '.dtu_port' $CONFIG_PATH)
QUERY_PERIOD=$(jq --raw-output '.query_period' $CONFIG_PATH)

# Création du fichier config.yaml pour l'application
cat <<EOF > /app/config.yaml
mqtt-broker: "${MQTT_HOST}"
mqtt-port: ${MQTT_PORT}
mqtt-user: "${MQTT_USER}"
mqtt-password: "${MQTT_PASS}"
dtu-host: "${DTU_HOST}"
dtu-port: ${DTU_PORT}
modbus-unit-id: 1
query-period: ${QUERY_PERIOD}
EOF

echo "Generated /app/config.yaml with options from Home Assistant."
# On affiche la config pour vérifier (en masquant le mot de passe)
cat /app/config.yaml | sed 's/mqtt-password: .*/mqtt-password: "********"/'

echo "Launching Hoymiles MQTT..."
python3 -m hoymiles_mqtt --config /app/config.yaml
