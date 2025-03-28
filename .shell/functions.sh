if [ -x "$(which ffmpeg)" ]; then
  function video-to-gif() {
    local srcFile=${1};
    local fps=${2:-15};
    local maxwidth=${3:--1};
    echo "Usage: video-to-gif [source.mp4] [fps=15] [maxwidth=preserve]";
    if [ -f "${srcFile}" ]; then
      local srcFileWithoutExtension="${srcFile%.*}";
      ffmpeg -y -i ${srcFile} -filter_complex "fps=${fps},scale=${maxwidth}:-1:flags=lanczos,split [o1] [o2];[o1] palettegen [p]; [o2] fifo [o3];[o3] [p] paletteuse" ${srcFileWithoutExtension}.gif
    fi;
  }

  alias video-to-gif=video-to-gif;
fi;

# Upload using transfer.sh – https://github.com/dutchcoders/transfer.sh/
# (apparently the default instance has been shut down)
#
# function transfer() {
#   local tmpfile=$( mktemp -t transferXXX )
#   curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
#   cat $tmpfile;
#   rm -f $tmpfile;
# }

# alias transfer=transfer;

# Convert RAW images to 2560 dimension max JPEG
if [ -x "$(which convert)" ]; then

  function convert-raw-to-jpg() {
    local quality=${1:-90};
    local source_files=${2:-\*.CR2};
    echo "Usage: convert-raw-to-jpg [quality=90] [source=\*.CR2]";
    echo "Converting all ${source_files} to JPEG (${quality} quality, ${max_dim}px max) to output/...";
    mkdir -p output 2> /dev/null;
    find . -maxdepth 1 -type f -iname "${source_files}" -print0 | \
      xargs -0 -n 1 -P 8 -I {} convert -verbose -units PixelsPerInch {} \
      -colorspace sRGB -set filename:new '%t' \
      -density 72 -format JPG -quality 85 'output/%[filename:new].jpg';
    echo 'Done.';
  }

  function convert-raw-to-jpg-resize() {
    local quality=${1:-85};
    local max_dim=${2:-2650};
    local source_files=${3:-\*.CR2};
    echo "Usage: convert-raw-to-jpg [quality=85] [max-dimension-px=2560] [source=\*.CR2]";
    echo "Converting all ${source_files} to JPEG (${quality} quality, ${max_dim}px max) to output/...";
    mkdir -p output 2> /dev/null;
    find . -maxdepth 1 -type f -iname "${source_files}" -print0 | \
      xargs -0 -n 1 -P 8 -I {} convert -verbose -units PixelsPerInch {} \
      -colorspace sRGB -resize ${max_dim}x${max_dim} -set filename:new '%t' \
      -density 72 -format JPG -quality ${quality} 'output/%[filename:new].jpg';
    echo 'Done.';
  }

  function convert-jpg-to-jpg() {
    local quality=${1:-85};
    local max_dim=${2:-2650};
    local source_files=${3:-\*.jpg};
    local maxdepth=${4:-1};
    echo "Usage: convert-jpg-to-jpg [quality=85] [max-dimension-px=2560] [source=\*.jpg] [maxdepth=1]";
    echo "Converting all ${source_files} to JPEG (${quality} quality, ${max_dim}px max) to output/...";
    mkdir -p output 2> /dev/null;
    find . -maxdepth ${maxdepth} -type f -iname "${source_files}" -print0 | \
      xargs -0 -n 1 -P 8 -I {} convert -verbose -units PixelsPerInch {} \
      -colorspace sRGB -resize ${max_dim}x${max_dim}\> -set filename:new '%t' \
      -density 72 -format JPG -quality ${quality} 'output/%[filename:new].jpg';
    echo 'Done.';

  }

fi;


# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@";
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
  local tmpFile="${@%/}.tar";
  tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

  size=$(
    stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
    stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
  );

  local cmd="";
  if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
    # the .tar file is smaller than 50 MB and Zopfli is available; use it
    cmd="zopfli";
  else
    if hash pigz 2> /dev/null; then
      cmd="pigz";
    else
      cmd="gzip";
    fi;
  fi;

  echo "Compressing .tar using \`${cmd}\`…";
  "${cmd}" -v "${tmpFile}" || return 1;
  [ -f "${tmpFile}" ] && rm "${tmpFile}";
  echo "${tmpFile}.gz created successfully.";
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@";
  else
    du $arg .[^.]* *;
  fi;
}

# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
  function diff() {
    git diff --no-index --color-words "$@";
  }
fi;

# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1");
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8";
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Create a git.io short URL
function gitio() {
  if [ -z "${1}" -o -z "${2}" ]; then
    echo "Usage: \`gitio slug url\`";
    return 1;
  fi;
  curl -i http://git.io/ -F "url=${2}" -F "code=${1}";
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
  if [ -z "${1}" ]; then
    echo "ERROR: No domain specified.";
    return 1;
  fi;

  local domain="${1}";
  echo "Testing ${domain}…";
  echo ""; # newline

  local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
    | openssl s_client -connect "${domain}:443" 2>&1);

  if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
    local certText=$(echo "${tmp}" \
      | openssl x509 -text -certopt "no_header, no_serial, no_version, \
      no_signame, no_validity, no_issuer, no_pubkey, no_sigdump, no_aux");
      echo "Common Name:";
      echo ""; # newline
      echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//";
      echo ""; # newline
      echo "Subject Alternative Name(s):";
      echo ""; # newline
      echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
        | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
      return 0;
  else
    echo "ERROR: Certificate not found.";
    return 1;
  fi;
}

# `tree-pretty` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tree-pretty() {
    tree -aC -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}

function hr() {
  echo "------------------------------------------------------------"
}

# ----------------------------------------
# OS X Toolbelt
# ----------------------------------------
#
if [ "$PLATFORM" = "osx" ]; then

  # function toolbelt-raspi-image-dump() {
  #   local now=$(date +"%Y-%m-%d__%H-%M-%S");
  #   local host=${2:="raspi"};
  #   local diskNumber=${1:--1}
  #   local bs="1m"
  #   local cmd="sudo dd if=/dev/rdisk$1 bs=$bs | gzip > ~/Desktop/$host-$now.pi.gz"
  #   local usage="Usage: $0 [sdCardDiskN] [hostname='raspi']"
  #   local example="Example:  $0 3 superillegales"
  #   if [ $# -eq 0 ]; then
  #       echo $usage;
  #       echo $example;
  #       return 1;
  #   elif $(diskutil list disk$diskNumber | grep -iq 'Apple\|APFS'); then
  #       echo "Warning: Apple filesystem detected on disk $1. This is probably your boot disk or external HDD, dummy. Format to FAT32.";
  #       return 1;
  #   fi;

  #   echo "Will run  '$cmd'";
  #   echo -n "Are you sure? (y/N): "
  #   local answer;
  #   answer=$(bash -c "read -n 1 c; echo \$c");
  #   if echo "$answer" | grep -iq "^y"; then
  #       echo "\n\nDumping card $diskNumber..."
  #       eval $cmd;
  #       if [[ $? -eq 0 ]]; then
  #           echo "Success.";
  #           return 0;
  #       else
  #           echo "[error] Dump failed."
  #           return 1;
  #       fi
  #   fi

  #   echo "\nAborted.";
  #   return 1;
  # }

  # function toolbelt-raspi-image-restore() {
  #   local diskNumber=${1:--1}
  #   local bs="1M"
  #   local cmd="gzip -dc $2 | sudo dd of=/dev/rdisk$1 bs=$bs"
  #   local usage="Usage: $0 [targetDiskN] [compressedImageFile]"
  #   if [[ $# -lt 2 ]]; then
  #       echo $usage;
  #       return 1;
  #   elif $(diskutil list disk$diskNumber | grep -iq 'Apple\|APFS'); then
  #       echo "Warning: Apple filesystem detected on disk $1. This is probably your boot disk or external HDD, dummy. Format to FAT32.";
  #       return 1;
  #   fi;

  #   echo "Will run  '$cmd'";
  #   echo -n "Are you sure? (y/N): "
  #   local answer;
  #   answer=$(bash -c "read -n 1 c; echo \$c");
  #   if echo "$answer" | grep -iq "^y"; then
  #       echo "\n\nRestoring card $(basename $2) to disk $diskNumber..."
  #       sudo diskutil unmountDisk /dev/disk$diskNumber;
  #       eval $cmd;
  #       if [[ $? -eq 0 ]]; then
  #           echo "Success.";
  #           return 0;
  #       else
  #           echo "[error] Restore failed."
  #           return 1;
  #       fi
  #   fi

  #   echo "\nAborted.";
  #   return 1;
  # }

  function toolbelt-dns-flush() {
    # El Capitan 10.11+
    if [[ -x "$(which dscacheutil)" ]]; then
        sudo dscacheutil -flushcache;
        return 0;
    # Yosemite 10.10
    elif  [[ -x "$(which discoveryutil)" ]]; then
        sudo discoveryutil mdnsflushcache;
        return 0;
    fi;

    echo "Cannot determine proper tool to flush dns on this OS.";
    return 1;
  }

fi;

# ----------------------------------------
# Linux Toolbelt/Shortcuts
# ----------------------------------------
if [ "$PLATFORM" = "linux" ]; then

  if [ "$LINUX_DESKTOP" = "gnome" ]; then
    # launches Nautilus;
    # similar to OS X's "open" command
    function open() {
      if [[ -z "$1" ]]; then
        nautilus $(pwd) &
      else
        nautilus $1 &
      fi;
    }

  elif [ "$LINUX_DESKTOP" = "xfce" ]; then
    # launches Xfce4 FileManager; behaves similar to OS X's "open" command
    function open() {
      if [ -z "$1" ]; then
        exo-open --launch FileManager --working-directory $(pwd);
      else
        exo-open --launch FileManager --working-directory $1;
      fi;
    }

    function toolbelt-linux-dotfiles-dump() {
      hr; echo "+ dconf"; hr;
      dconf dump / > ~/dev/dotfiles/linux/deep-nightmare.dconf.dump

      hr; echo "+ ~/.conky"; hr;
      rsync -ap ~/.conky ~/dev/dotfiles/linux/

      hr; echo "+ ~/.config/compiz-1"; hr;
      rsync -ap ~/.config/compiz-1 ~/dev/dotfiles/linux/.config/

      hr; echo "+ ~/.config/menus"; hr;
      rsync -ap ~/.config/menus ~/dev/dotfiles/linux/.config/

      hr; echo "+ ~/.config/pulse"; hr;
      rsync -ap ~/.config/pulse ~/dev/dotfiles/linux/.config/

      hr; echo "+ ~/.config/Thunar"; hr;
      rsync -ap ~/.config/Thunar ~/dev/dotfiles/linux/.config/

      hr; echo "+ ~/.config/transmission"; hr;
      rsync -ap ~/.config/transmission ~/dev/dotfiles/linux/.config/

      hr; echo "+ ~/.config/terminator"; hr;
      rsync -ap ~/.config/terminator ~/dev/dotfiles/linux/.config/

      hr; echo "+ ~/.config/vlc"; hr;
      rsync -ap ~/.config/vlc ~/dev/dotfiles/linux/.config/

      hr; echo "+ ~/.config/xfce4"; hr;
      rsync -ap ~/.config/xfce4 ~/dev/dotfiles/linux/.config/

      hr; echo "+ ~/.config/Zeal"; hr;
      rsync -ap ~/.config/Zeal ~/dev/dotfiles/linux/.config/

    }

  elif [ "$LINUX_DESKTOP" = "kde" ]; then

    # launches Dolphin, KDE's file manager; behaves similar to OS X's "open" command
    function open() {
      if [ -z "$1" ]; then
          nohup dolphin $(pwd) > /dev/null 2>&1 &
      else
          nohup dolphin $1 > /dev/null 2>&1 &
      fi;
    }
  fi;
fi;
