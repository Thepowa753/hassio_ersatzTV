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

# =========================================================
# TRUCCO HACKER: Wrapper FFmpeg per risolvere il bug ASP.NET
# =========================================================
if [ ! -f "/usr/local/bin/ffmpeg_real" ]; then
    echo "[ErsatzTV] Installazione dell'intercettatore FFmpeg per i decimali..."
    # Rinomina il VERO ffmpeg
    mv /usr/local/bin/ffmpeg /usr/local/bin/ffmpeg_real
    
    # Crea un falso ffmpeg che corregge il testo al volo
    cat << 'EOF' > /usr/local/bin/ffmpeg
#!/bin/bash
NEW_ARGS=()
for arg in "$@"; do
  # Se l'argomento contiene la grafica della barra musicale...
  if [[ "$arg" == *"eval=frame"* ]]; then
    # Sostituisce la virgola con il punto SOLO se è in mezzo a due numeri
    NEW_ARGS+=("$(echo "$arg" | sed -E 's/([0-9]),([0-9])/\1.\2/g')")
  else
    # Lascia intatti i percorsi dei file e il resto
    NEW_ARGS+=("$arg")
  fi
done
# Lancia il VERO ffmpeg con i parametri corretti
exec /usr/local/bin/ffmpeg_real "${NEW_ARGS[@]}"
EOF
    # Rende eseguibile il nostro trucco
    chmod +x /usr/local/bin/ffmpeg
fi

exec /app/ErsatzTV
