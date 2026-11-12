#!/usr/bin/env bash
# Build the Onboarding handout PDFs.
#
#   printout.pdf      A5 portrait flyer (larger type, hand-held)
#   printout_a4_2up.pdf  two A5 flyers side by side on A4, with a cut guide
#
# Needs lualatex (TeX Live / MacTeX) and pdfunite (poppler-utils, ships with poppler).
set -euo pipefail
cd "$(dirname "$0")"

FLAGS=(-interaction=nonstopmode -halt-on-error)

echo "==> A5 flyer"
lualatex "${FLAGS[@]}" printout.tex >/dev/null

echo "==> imposition: two flyers on A4"
# pdfpages' nup=2x1 needs two logical pages, so duplicate the single-page flyer
pdfunite printout.pdf printout.pdf flyer_x2.pdf
lualatex "${FLAGS[@]}" printout_a4_2up.tex >/dev/null
rm -f flyer_x2.pdf

echo
for f in printout.pdf printout_a4_2up.pdf; do
	printf '%-22s %s page(s), %s\n' "$f" \
		"$(pdfinfo "$f" | awk '/^Pages:/{print $2}')" \
		"$(pdfinfo "$f" | awk '/^Page size:/{print $3" x "$5" pts"}')"
done
