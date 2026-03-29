#!/usr/bin/env bash

echo "Starting Hoymiles-MQTT..."

# Generate configuration file
cat <<EOF > /app/config.yaml
mqtt:
  host: ${MQTT_HOST}
  port: ${MQTT_PORT}
  username: ${MQTT_USER}
  password: ${MQTT_PASS}

dtu:
  host: ${DTU_HOST}
  port: ${DTU_PORT}
  modbus-unit-id: 1
  query-period: ${QUERY_PERIOD}
EOF

echo "Generated /app/config.yaml:"
cat /app/config.yaml

echo "Launching Hoymiles MQTT..."
python3 -m hoymiles_mqtt --config /app/config.yaml
``
