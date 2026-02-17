# ══════════════════════════════════════════════════════════════
#  LaTeX Build Environment — Reproducible PDF compilation
#  Multi-stage build: compile → extract lightweight PDF output
# ══════════════════════════════════════════════════════════════

# ── Stage 1: Build ────────────────────────────────────────────
FROM debian:bookworm-slim AS builder

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install TeX Live and utilities in a single layer
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        texlive-latex-base \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-science \
        texlive-pictures \
        texlive-bibtex-extra \
        biber \
        latexmk \
        make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Copy only source files (respects .dockerignore)
COPY . .

# Create the output directory
RUN mkdir -p /workspace/output

# Compile the document
RUN latexmk -pdf -interaction=nonstopmode -outdir=/workspace/output main.tex

# ── Stage 2: Lightweight output image ────────────────────────
FROM alpine:3.19 AS output

# Copy only the generated PDF from the builder
COPY --from=builder /workspace/output/*.pdf /output/

# Default: list the built PDF
CMD ["ls", "-lh", "/output/"]

# ══════════════════════════════════════════════════════════════
#  Usage targets (build with --target)
#
#  Full build (default) — produces a minimal image with the PDF:
#    docker build -t latex-pdf .
#    docker run --rm -v "$(pwd)/output:/out" latex-pdf cp /output/main.pdf /out/
#
#  Interactive shell — drop into the TeX environment:
#    docker build --target builder -t latex-env .
#    docker run --rm -it -v "$(pwd):/workspace" latex-env bash
#
#  One-shot compile — mount source, get PDF back:
#    docker build --target builder -t latex-env .
#    docker run --rm -v "$(pwd):/workspace" latex-env \
#      latexmk -pdf -interaction=nonstopmode -outdir=output main.tex
# ══════════════════════════════════════════════════════════════
