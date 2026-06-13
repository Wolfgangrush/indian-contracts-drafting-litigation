#!/usr/bin/env bash
# pair_md_to_docx.sh — convert a Markdown output artifact to a paired .docx
# using the shipped reference.docx + the post-pandoc table-width fix script.
#
# Used by every agent in the wolfgang_rush drafting pipeline (Reader, Format,
# Drafter, Verifier, Refiner, Overseer) to ensure every .md output has a paired
# .docx the advocate can open in Word.
#
# Usage:
#   pair_md_to_docx.sh <input.md> [<reference.docx>] [<output.docx>]
#
# If <reference.docx> is omitted, defaults to the reference.docx in the same
# directory as this script.
# If <output.docx> is omitted, replaces the .md extension with .docx in <input.md>.
#
# Requires: pandoc, python3 with python-docx, and fix_docx_tables.py in the
# same directory as this script.

set -euo pipefail

INPUT_MD="${1:-}"
REF_DOCX="${2:-}"
OUTPUT_DOCX="${3:-}"

if [ -z "$INPUT_MD" ]; then
    echo "Usage: $0 <input.md> [<reference.docx>] [<output.docx>]" >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -z "$REF_DOCX" ]; then
    REF_DOCX="$SCRIPT_DIR/reference.docx"
fi

if [ -z "$OUTPUT_DOCX" ]; then
    OUTPUT_DOCX="${INPUT_MD%.md}.docx"
fi

if [ ! -f "$REF_DOCX" ]; then
    echo "ERROR: reference.docx not found at $REF_DOCX" >&2
    exit 2
fi

if [ ! -f "$INPUT_MD" ]; then
    echo "ERROR: input markdown not found at $INPUT_MD" >&2
    exit 2
fi

# Step 1 — pandoc → .docx with locked Word styles
pandoc "$INPUT_MD" -o "$OUTPUT_DOCX" \
    --reference-doc="$REF_DOCX" \
    --from=markdown+pipe_tables+raw_tex

# Step 2 — force table column widths
if [ -f "$SCRIPT_DIR/fix_docx_tables.py" ]; then
    python3 "$SCRIPT_DIR/fix_docx_tables.py" "$OUTPUT_DOCX"
fi

echo "OK · paired $INPUT_MD → $OUTPUT_DOCX"
