#!/bin/bash
pandoc *.md \
        --from Markdown \
        --to pdf \
        -o book.pdf \
        --toc \
        --highlight-style kate \
