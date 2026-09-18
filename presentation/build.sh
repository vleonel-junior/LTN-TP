#!/usr/bin/env bash
# Construit les DEUX sorties depuis main.tex :
#   main.pdf        -> deck propre, SANS notes  (celui qu'on partage)
#   main-notes.pdf  -> version pupitre, diapo + notes (jamais partagee)
set -e
cd "$(dirname "$0")"

echo "[1/2] main.pdf (propre)"
latexmk -pdf main.tex

echo "[2/2] main-notes.pdf (pupitre)"
latexmk -pdf main-notes.tex

echo "OK  ->  main.pdf | main-notes.pdf"
