#!/usr/bin/env bash

#docker compose pull
docker compose up -d

PORT=$(docker compose port pipelines-cli 8080 | cut -d ":" -f 2)
echo "CloudControl is initializing. Check out http://localhost:${PORT} for details"