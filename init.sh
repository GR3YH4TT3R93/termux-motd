#!/data/data/com.termux/files/usr/bin/env zsh

clear

# Early exit if MOTD directory doesn't exist
MOTD="$PREFIX/etc/motd"
[[ ! -d "$MOTD" ]] && exit 0

# Use array to collect files, avoiding subshell in for loop
# and combining find operations efficiently
motd_files=()
while IFS= read -r -d '' file; do
    motd_files+=("$file")
done < <(find "$MOTD" -maxdepth 1 -type f -regex '.+/[0-9\-].+' -not -regex ".+\.disabled" -print0 | sort -z)

# Execute files if any were found
if (( ${#motd_files[@]} > 0 )); then
    for script in "${motd_files[@]}"; do
        # Execute directly instead of spawning new zsh
        if [[ -r "$script" && -x "$script" ]]; then
            "$script"
        elif [[ -r "$script" ]]; then
            # Only spawn zsh if file isn't executable
            zsh "$script"
        fi
    done
fi
