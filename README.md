# Curriculum Vitae

This repository contains the template for my curriculum vitae, built with [Typst](https://typst.app) – a modern, fast
markup-based typesetting system designed as an alternative to LaTeX.

## Structure

- [`main.typ`](main.typ) - Main CV document
- [`compile.sh`](compile.sh) - Build script to generate the CV PDFs for all translations
- [`content/`](content/) - General and language-specific content such as texts and images (German and English)
- [`fonts/`](fonts/) - Fonts used in the CV
- [`icons/`](icons/) - Icons used in the CV
- [`dist/`](dist/) - Generated PDFs

## Download

The latest versions of the CV template with example data are available in
the [Releases](https://github.com/maximilian-hammerl/cv-template/releases) section in both
[**German**](https://github.com/maximilian-hammerl/cv-template/releases/latest/download/cv-german.pdf) and
[**English**](https://github.com/maximilian-hammerl/cv-template/releases/latest/download/cv-english.pdf).

## Licensing

This repository uses multiple licenses:

- The Typst template and build script are licensed under the [MIT License](LICENSE-template.md). This includes:
  `main.typ`, `compile.sh`, and other generic template/build files unless noted otherwise.
- The personal CV content is not open source and is [All Rights Reserved](LICENSE-content.md). This includes: All files
  containing CV text/content such as the image files, translation files, generated files, and other personal assets.
- Fonts, icons, and other third-party assets are subject to their own upstream licenses and are not relicensed by this
  repository.
