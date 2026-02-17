# 📄 LaTeX Workspace

A local Overleaf-like LaTeX environment powered by **VS Code + LaTeX Workshop**.

## 🚀 Quick Start

1. Open `main.tex`
2. Press **Ctrl+S** to compile
3. Click the **🔍 Preview** button (top-right) to open the PDF side-by-side

## ⌨️ Key Shortcuts

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
├── .vscode/
│   └── settings.json    # LaTeX Workshop + editor config
├── .gitignore            # Ignores build artifacts
├── main.tex              # Your main document
├── figures/              # Place images here
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
