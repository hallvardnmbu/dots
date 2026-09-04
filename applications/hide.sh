#!/bin/bash

SHOW_FILE="/home/adiuvo/.config/applications/show"
LOCATIONS=(
    "/usr/share/applications/"
    "/usr/local/share/applications/"
    "/var/lib/flatpak/exports/share/applications/"
    "/home/adiuvo/.local/share/applications/"
)

if [[ $EUID -ne 0 ]]; then
   echo "Must be run with sudo."
   exit 1
fi

if [[ ! -f $SHOW_FILE ]]; then
    echo "Error: Whitelist file not found at $SHOW_FILE"
    echo "Please create it first, with one app name (like 'firefox') per line."
    exit 1
fi

declare -A WHITELIST
while IFS= read -r line; do
    clean_line=$(echo "$line" | sed 's/\r$//' | xargs)
    if [[ -n "$clean_line" ]]; then
        WHITELIST["$clean_line"]=1
    fi
done < "$SHOW_FILE"

echo "Loaded ${#WHITELIST[@]} applications to show."

# Strip all existing NoDisplay=true
strip_nodisplay() {
    local file="$1"
    if grep -q "^NoDisplay=true" "$file"; then
        sed -i '/^NoDisplay=true/d' "$file"
    fi
}

echo "Resetting..."
for location in "${LOCATIONS[@]}"; do
    [[ -d "$location" ]] || continue
    shopt -s nullglob
    for file in "$location"/*.desktop; do
        [[ -f "$file" ]] && strip_nodisplay "$file"
    done
    shopt -u nullglob
done

echo "Applying whitelist..."
for location in "${LOCATIONS[@]}"; do
    if [[ ! -d "$location" ]]; then
        continue
    fi

    shopt -s nullglob
    for file in "$location"/*.desktop; do
        if [[ -f "$file" ]]; then
            base_name=$(basename "$file" .desktop)

            if [[ -n "${WHITELIST[$base_name]}" ]]; then
                echo "* showing: $base_name"
                # already stripped above, nothing more to do
            else
                echo "* hiding: $base_name"
                if grep -q "\[Desktop Entry\]" "$file"; then
                    sed -i '/\[Desktop Entry\]/a NoDisplay=true' "$file"
                else
                    echo "NoDisplay=true" >> "$file"
                fi
            fi
        fi
    done
    shopt -u nullglob
    update-desktop-database "$location" 2>/dev/null
done

echo "Done."
