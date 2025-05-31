#!/usr/bin/zsh

# Set error handling for robustness
set -euo pipefail

# Define paths using variables for better maintainability
MOTD_DIR="$PREFIX/etc/motd"
MOTD_INIT="$MOTD_DIR/init.sh"
ZSH_PROFILE="$PREFIX/etc/zprofile"
BASH_PROFILE="$PREFIX/etc/profile"

# Check if motd directory or file already exists
if [[ -e "$MOTD_DIR" ]]; then
    echo "Warning: MOTD directory/file already exists at $MOTD_DIR"
    printf "Remove existing installation and continue? (y/N): " > /dev/tty
    read < /dev/tty
    if [[ $REPLY == [Yy]* ]]; then
        echo "Removing existing MOTD file/folder..."
        rm -rf "$MOTD_DIR"
    else
        echo "Installation cancelled."
        exit 0
    fi
fi

# Clone repository (with error handling)
echo "Installing termux-motd..."
if ! git clone https://github.com/GR3YH4TT3R93/termux-motd.git "$MOTD_DIR"; then
    echo "Error: Failed to clone repository" >&2
    exit 1
fi

# Determine profile file using parameter expansion instead of basename subprocess
case "${SHELL##*/}" in
    zsh)
        profile_file="$ZSH_PROFILE"
        ;;
    *)
        profile_file="$BASH_PROFILE"
        ;;
esac

# Check if init script already exists in profile using built-in grep
# Fix the logic - original had inverted condition
if ! grep -Fq "$MOTD_INIT" "$profile_file" 2>/dev/null; then
    echo "Adding MOTD initialization to $profile_file"
    echo "$MOTD_INIT" >> "$profile_file"
    echo "MOTD installed successfully!"
else
    echo "MOTD initialization already present in $profile_file"
fi

# Make init script executable if it exists
[[ -f "$MOTD_INIT" ]] && chmod +x "$MOTD_INIT"

echo "Installation complete. Restart your shell to see the MOTD."
