#!/opt/homebrew/bin/bash -x

LOG=/Volumes/heatsink/beets/transmission-import-logs/import-$$.log
exec > $LOG 2>&1

echo "${TR_TORRENT_DIR}/${TR_TORRENT_NAME}"

/opt/homebrew/bin/terminal-notifier \
  -title "${TR_TORRENT_NAME}" \
  -message "importing..."

# Go to the download directory (the file list is relative to that point)
/Users/drew/.python-uv-env-default/bin/beet im "${TR_TORRENT_DIR}/${TR_TORRENT_NAME}" && \
  \
/opt/homebrew/bin/terminal-notifier \
  -title "${TR_TORRENT_NAME}" \
  -message "📀 💿 📀" \
  -activate 'com.swinsian.Swinsian' \
  -sound Funk \
  || \
/opt/homebrew/bin/terminal-notifier \
  -title "${TR_TORRENT_NAME}" \
  -message "❌ ❌ ❌" \
  -activate 'com.googlecode.iterm2' \
  -sound Sosumi
  # -appIcon http://vjeantet.fr/images/logo.png \
