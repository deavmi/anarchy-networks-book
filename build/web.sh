#!/bin/bash
pandoc *.md communications/*.md \
        --from Markdown \
        --to html \
        -o book.html \
        --toc \
        --highlight-style kate \
        --top-level-division=part \