#!/bin/bash -x

LOG=/tmp/transmission-post-download-$$.log
exec > $LOG 2>&1

echo "${TR_TORRENT_DIR}/${TR_TORRENT_NAME}"

/usr/local/bin/terminal-notifier \
  -title "${TR_TORRENT_NAME}" \
  -message "importing..."

# Go to the download directory (the file list is relative to that point)
/Users/drew/.pyenv/shims/beet im "${TR_TORRENT_DIR}/${TR_TORRENT_NAME}" && \
  \
/usr/local/bin/terminal-notifier \
  -title "${TR_TORRENT_NAME}" \
  -message "📀 💿 📀" \
  -activate 'com.swinsian.Swinsian' \
  -sound Funk \
  || \
/usr/local/bin/terminal-notifier \
  -title "${TR_TORRENT_NAME}" \
  -message "❌ ❌ ❌" \
  -activate 'com.googlecode.iterm2' \
  -sound Sosumi
  # -appIcon http://vjeantet.fr/images/logo.png \
```
