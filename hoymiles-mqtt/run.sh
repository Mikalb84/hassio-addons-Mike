#!/usr/bin/env bash
set -e

echo "Starting Hoymiles-MQTT add-on..."

# Création du fichier config.yaml avec les noms d'options explicites
# Note : on utilise les clés à plat comme demandé par l'application
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

echo "Generated /app/config.yaml:"
# On masque le mot de passe dans les logs par sécurité
cat /app/config.yaml | sed 's/mqtt-password: .*/mqtt-password: "********"/'

echo "Launching Hoymiles MQTT..."
python3 -m hoymiles_mqtt --config /app/config.yaml
