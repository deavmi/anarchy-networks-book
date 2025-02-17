#!/bin/bash
pandoc *.md communications/*.md \
        --from Markdown \
        --to pdf \
        -o book.pdf \
        --toc \
        --highlight-style kate \
        --top-level-division=part \
