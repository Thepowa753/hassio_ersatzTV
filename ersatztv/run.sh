#!/bin/bash
set -e

OPTIONS_FILE="/data/options.json"

# Read configuration from Home Assistant add-on options
if [ -f "${OPTIONS_FILE}" ]; then
    BASE_FOLDER=$(jq -r '.base_folder // "/media"' "${OPTIONS_FILE}")
else
    BASE_FOLDER="/media"
fi

echo "[ErsatzTV] Starting on port 8409 with base folder ${BASE_FOLDER}"

export ASPNETCORE_URLS="http://0.0.0.0:8409"
export ETV_CONFIG_FOLDER="${BASE_FOLDER}"
export ETV_TRANSCODE_FOLDER="/transcode"
export ETV_DISABLE_VULKAN=1

exec /app/ErsatzTV
