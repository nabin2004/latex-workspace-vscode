# 📄 LaTeX Workspace

A local Overleaf-like LaTeX environment powered by **VS Code + LaTeX Workshop**, with full **Docker** support for reproducible builds — no local TeX installation needed.

---

## 🚀 Quick Start

### Option A — VS Code (local TeX Live)

1. Open `main.tex`
2. Press **Ctrl+S** to compile
3. Click the **🔍 Preview** button (top-right) to open the PDF side-by-side

### Option B — Docker (no local install required)

```bash
# One-shot build → produces output/main.pdf
docker compose run --rm build

# Or build entirely inside Docker (multi-stage, PDF-only output image)
docker build -t latex-pdf .
docker run --rm -v "$(pwd)/output:/out" latex-pdf cp /output/main.pdf /out/
```

---

## 🐳 Docker Usage

> **Prerequisites:** [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) (v2+).

### Build the PDF

```bash
docker compose run --rm build
```

The compiled PDF appears at `output/main.pdf`.

### Watch Mode (auto-recompile on save)

```bash
docker compose run --rm watch
```

Edit `main.tex` in any editor; the PDF rebuilds automatically.

### Clean Build Artifacts

```bash
docker compose run --rm clean
```

### Interactive Shell

```bash
docker compose run --rm shell
```

Drops you into a bash shell with the full TeX Live toolchain available.

### Standalone Docker (without Compose)

```bash
# Build the builder image
docker build --target builder -t latex-env .

# Compile (mount current directory)
docker run --rm -v "$(pwd):/workspace" latex-env \
  latexmk -pdf -interaction=nonstopmode -outdir=output main.tex

# Full multi-stage build (tiny image with only the PDF)
docker build -t latex-pdf .
docker run --rm latex-pdf          # lists the PDF
```

---

## ⌨️ Key Shortcuts (VS Code)

| Shortcut               | Action                        |
|------------------------|-------------------------------|
| `Ctrl+S`               | Save & auto-compile           |
| `Ctrl+Alt+V`           | Open PDF preview              |
| `Ctrl+Click` on PDF    | Jump to source line (SyncTeX) |
| `Ctrl+Shift+G`         | Open Git panel                |
| `Ctrl+Space`           | LaTeX IntelliSense            |

## 📂 Project Structure

```
latex-workspace/
├── .dockerignore         # Files excluded from Docker build
├── .gitignore            # Ignores build artifacts
├── .vscode/
│   └── settings.json     # LaTeX Workshop + editor config
├── Dockerfile            # Multi-stage LaTeX build
├── docker-compose.yml    # Convenience build/watch/clean/shell
├── main.tex              # Your main document
├── figures/              # Place images here
├── output/               # Compiled PDF output (git-ignored)
└── README.md
```

## 🔗 Connect to GitHub

```bash
# Create a repo on GitHub, then:
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
```

Or use VS Code's built-in **Publish to GitHub** button in the Source Control panel.

## 🛠 Installed Extensions

- **LaTeX Workshop** — compile, preview, IntelliSense
- **LaTeX Utilities** — smart paste, live snippets, word count
- **LTeX** — grammar & spell checking

## 📝 Tips

- **Add more `.tex` files** and use `\input{filename}` to include them
- **Put images** in the `figures/` folder and use `\includegraphics{figures/image}`
- **Bibliography**: create a `.bib` file and use `\bibliography{refs}`
- The `.gitignore` keeps only source files in version control (no build artifacts)
- **CI/CD**: Use the Dockerfile in GitHub Actions to auto-build PDFs on push
