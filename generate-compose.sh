#!/bin/bash

echo "version: '3.8'" > docker-compose.yml
echo "services:" >> docker-compose.yml

docker build -t soundness . --no-cache

for i in $(seq 1 27); do
  echo "  soundness$i:" >> docker-compose.yml
  echo "    container_name: ubuntu$i" >> docker-compose.yml
  echo "    image: soundness" >> docker-compose.yml
  echo "    command: tail -f /var/log/lastlog" >> docker-compose.yml
  echo "    volumes:" >> docker-compose.yml
  echo "      - ./genkey.sh:/genkey.sh" >> docker-compose.yml
  echo "    restart: always" >> docker-compose.yml
done
