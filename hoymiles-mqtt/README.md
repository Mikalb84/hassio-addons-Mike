# Hoymiles MQTT Add-on for Home Assistant

This add-on reads Hoymiles DTU-Pro-S via Modbus TCP and publishes inverter
data to MQTT (auto-discovery compatible with Home Assistant).

## Features
- Fast refresh (5 seconds)
- Local Modbus TCP (DTU-Pro-S compatible)
- MQTT auto-discovery for HA
- Does NOT break S-Miles Cloud

## Configuration Options
- `dtu_host`: IP of your DTU-Pro-S
- `query_period`: refresh interval (default 5 sec)
- `mqtt_host`: IP of your MQTT broker (same as HAOS if Mosquitto is installed)

## MQTT example topics:
`hoymiles/DTUxxxx/inverter/HMS1000-2T/...`
