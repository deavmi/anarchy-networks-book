#!/bin/bash
pandoc *.md communications/* \
        --from Markdown \
        --to pdf \
        -o book.pdf \
        --toc \
        --highlight-style kate \
        --top-level-division=part \
