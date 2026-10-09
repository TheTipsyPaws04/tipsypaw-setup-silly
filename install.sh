#!/data/data/com.termux/files/usr/bin/bash
# Tipsypaw SillyTavern Setup - Termux / Android
set -e

REPO="https://github.com/SillyTavern/SillyTavern"
DIR="$HOME/SillyTavern"

echo "[+] Updating Termux packages..."
pkg update -y && pkg upgrade -y

echo "[+] Installing dependencies..."
pkg install -y git nodejs-lts

if [ -d "$DIR/.git" ]; then
  echo "[+] Updating SillyTavern..."
  cd "$DIR"
  git pull --rebase --autostash
else
  echo "[+] Downloading SillyTavern..."
  git clone -b release "$REPO" "$DIR"
  cd "$DIR"
fi

command -v termux-wake-lock >/dev/null 2>&1 && termux-wake-lock || true

echo "[+] Starting SillyTavern..."
bash start.sh
