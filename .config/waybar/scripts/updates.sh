#!/bin/bash

# Contar actualizaciones oficiales (seguro, sin sudo)
official=$(checkupdates 2> /dev/null | wc -l)

# Contar actualizaciones de AUR (si usas yay)
aur=$(yay -Qua 2> /dev/null | wc -l)

# Sumar total
total=$((official + aur))

# Generar JSON para Waybar
if [ $total -gt 0 ]; then
    # Texto: Icono caja + número
    # Tooltip: Detalle desglosado
    echo "{\"text\": \" $total\", \"tooltip\": \"Pacman: $official\nAUR: $aur\", \"class\": \"pending\"}"
else
    # Si no hay nada, devuelve vacío o un check (opcional)
    echo "{\"text\": \"\", \"tooltip\": \"System Updated\", \"class\": \"updated\"}"
fi
