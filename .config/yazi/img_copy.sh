#!/bin/bash

FILE="$1"
# Obtenemos el tipo exacto (ej: image/jpeg o image/png)
MIME=$(file --mime-type -b "$FILE")

# 1. Si es JPG, lo mandamos como JPG (Más rápido, no convierte nada)
if [[ "$MIME" == "image/jpeg" ]]; then
    cat "$FILE" | wl-copy --type "image/jpeg"
    notify-send "Yazi" "JPG copiado (Raw)"

# 2. Si es PNG, lo mandamos como PNG
elif [[ "$MIME" == "image/png" ]]; then
    cat "$FILE" | wl-copy --type "image/png"
    notify-send "Yazi" "PNG copiado (Raw)"

# 3. Si es cualquier otra cosa (WebP, BMP), convertimos a PNG para compatibilidad
else
    magick "$FILE" png:- | wl-copy -t image/png
    notify-send "Yazi" "Convertido a PNG y copiado"
fi