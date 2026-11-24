#!/bin/sh
engine=$(ibus engine 2>/dev/null)
case "$engine" in
    ""|xkb:*) printf 'EN\n' ;;
    *)        printf '中\n' ;;
esac
