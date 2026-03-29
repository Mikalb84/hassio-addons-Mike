#!/bin/bash

echo "Starting Hoymiles-MQTT..."

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

python3 -m hoymiles_mqtt --config /app/config.yaml
