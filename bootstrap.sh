#!/usr/bin/env bash

export PATH="${HOME}/.cargo/bin:$PATH"

echo -n "Checking cargo-binstall: "
if ! command -v cargo-binstall; then
    sudo pacman -S cargo-binstall
fi

echo -n "Checking upt:            "
if ! command -v upt ; then
    cargo binstall -y upt
    sudo cp "${HOME}/.cargo/bin/upt" /usr/local/bin/upt
fi

echo -n "Checking rotz:           "
if ! command -v rotz ; then
    cargo binstall -y rotz
fi




