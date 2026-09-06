#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/.build"

if command -v latexmk >/dev/null 2>&1; then
  ENGINE=latexmk
elif command -v pdflatex >/dev/null 2>&1; then
  ENGINE=pdflatex
else
  echo "TeX tidak ditemukan: perlu latexmk atau pdflatex." >&2
  exit 127
fi

rm -rf "$BUILD"
mkdir -p "$BUILD"

compile_one() {
  tex="$1"
  dir=$(dirname "$tex")
  file=$(basename "$tex")
  stem=${file%.tex}

  case "$dir" in
    "$ROOT") rel="." ;;
    "$ROOT"/*) rel=${dir#"$ROOT"/} ;;
    *) rel=$(basename "$dir") ;;
  esac

  out="$BUILD/$rel"
  mkdir -p "$out"

  echo
  echo "==> COMPILE ${tex#"$ROOT"/}"

  if [ "$ENGINE" = "latexmk" ]; then
    (
      cd "$dir"
      latexmk -pdf \
        -interaction=nonstopmode \
        -halt-on-error \
        -file-line-error \
        -outdir="$out" \
        "$file"
    )
  else
    (
      cd "$dir"
      pdflatex \
        -interaction=nonstopmode \
        -halt-on-error \
        -file-line-error \
        -output-directory="$out" \
        "$file"
      pdflatex \
        -interaction=nonstopmode \
        -halt-on-error \
        -file-line-error \
        -output-directory="$out" \
        "$file"
    )
  fi

  pdf="$out/$stem.pdf"
  [ -s "$pdf" ] || {
    echo "ERROR: PDF tidak terbentuk: $pdf" >&2
    exit 2
  }

  cp "$pdf" "$dir/$stem.pdf"
  echo "    OK -> $rel/$stem.pdf"
}

for content_dir in \
  "$ROOT/Slide" \
  "$ROOT/Lembar_Kerja" \
  "$ROOT/Modul_Praktikum"
do
  [ -d "$content_dir" ] || continue

  find "$content_dir" -type f -name '*.tex' -print | sort | while IFS= read -r tex; do
    if grep -Eq '^[[:space:]]*\\documentclass' "$tex"; then
      compile_one "$tex"
    fi
  done
done

rm -rf "$BUILD"

echo
echo "============================================================"
echo "BUILD SELESAI"
echo "============================================================"
find "$ROOT/Slide" "$ROOT/Lembar_Kerja" "$ROOT/Modul_Praktikum" \
  -type f -name '*.pdf' -print 2>/dev/null \
  | sort \
  | sed "s#^$ROOT/#    #"
