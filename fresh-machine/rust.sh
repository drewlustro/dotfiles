#!/usr/bin/env bash

# Rust installation
curl https://sh.rustup.rs -sSf | sh;
mkdir -p "$HOME/.cargo" 2>/dev/null;
