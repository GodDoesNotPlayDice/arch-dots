#!/bin/bash

# --- CONFIGURACIÓN ---
# Pon aquí la ruta de tu carpeta de imágenes
DIR="$HOME/Pictures/purple_bgs/"

# Tiempo en segundos (300 segundos = 5 minutos)
INTERVALO=30
# ---------------------

# Comprobamos que swww esté corriendo
swww query || swww-daemon --format xrgb &

while true; do
    # Busca una imagen al azar (jpg, png, jpeg, webp) dentro de la carpeta
    IMG=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) | shuf -n 1)

    # La aplica con una transición bonita
    # Tipos de transición: simple, fade, left, right, top, bottom, wipe, wave, grow, center, outer, random
    swww img "$IMG" --transition-type random --transition-step 90 --transition-fps 60

    # Espera el tiempo definido
    sleep $INTERVALO
done