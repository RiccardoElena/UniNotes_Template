# LaTeX Template for Computer Science Notes
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

> This template is based on an AI-generated scaffold and has been manually enriched and maintained afterwards. Use it as a starting point and adapt it to your needs. A minimal working example is provided in `main.tex`.

## Table of Contents

- [Features](#features)
  - [Color-coded Environments](#color-coded-environments)
  - [Language Selection](#language-selection)
  - [Other capabilities](#other-capabilities)
- [Quick Start](#quick-start)
  - [Document Structure](#document-structure)
  - [Example Environments](#example-environments)
    - [Definition](#definition)
    - [Theorem with Proof](#theorem-with-proof)
    - [Example with Code](#example-with-code)
    - [Note](#note)
    - [Warning](#warning)
- [Custom Commands](#custom-commands)
  - [Special Notations](#special-notations)
  - [Usage Example](#usage-example)
- [Supported Programming Languages](#supported-programming-languages)
- [UTF-8 Support](#utf-8-support)
- [File Organization](#file-organization)
  - [Including External Chapters](#including-external-chapters)
- [References and Citations](#references-and-citations)
  - [Bibliography Example](#bibliography-example)
- [Tips](#tips)
- [Build / Compile](#build--compile)
- [License and Contributing](#license)

## Features

### Color-coded Environments

The template includes several thematic environments, each with a distinct color:

- **🔵 Definition** (Blue): For formal concept definitions
- **🔴 Theorem** (Red): For theorems and important results
- **🟠 Lemma** (Orange): For lemmas and auxiliary results
- **🟣 Proposition** (Purple): For propositions and claims
- **🟢 Corollary** (Green): For corollaries derived from theorems
- **🔷 Example** (Teal): For practical examples and use cases
- **🟡 Note** (Yellow): For important remarks and observations
- **🔺 Warning** (Red): For cautions and common pitfalls
- **⚙️ Algorithm** (Gray-blue): For algorithm descriptions

### Language Selection

The template comes with built-in bilingual support (English and Italian) and
**defaults to Italian** (for full backward compatibility with existing projects).

All user-facing text is localized based on the class option: `english` or `italian` (default).

To use English, just pass the `english` option to the class:

```latex
\documentclass[english]{csnotes}
```

To use Italian (the default), no change is needed:

```latex
\documentclass{csnotes}
```

### Other capabilities

- Clean, professional design
- Syntax highlighting for code listings
- Pseudocode / algorithm environments
- Customizable title page
- Automatic headers and footers
- Automatic table of contents
- Intelligent cross-references
- Full math support
- Theorem boxes with drop shadows
- Handy macros for common notations

## Quick Start

### Document Structure

```latex
\documentclass{csnotes}

% Document meta
\title{Course Title}
\author{Your Name}
\date{\today}

% Title page info
\university{University Name}
\department{Department}
\course{Degree Program}
\subject{Course Name}
\academicyear{Academic Year 2024/2025}

\begin{document}

\maketitlepage  % Create the title page
\tableofcontents % Table of contents
\newpage

% Your content here

\end{document}
```

### Example Environments

#### Definition

```latex
\begin{definition}[Definition name]
Text of the definition with \keyword{highlighted keywords}.
\end{definition}
```

#### Theorem with Proof

```latex
\begin{theorem}[Theorem name]
Statement of the theorem.
\end{theorem}

\begin{proof}
Proof of the theorem.
\end{proof}
```

#### Example with Code

```latex
\begin{example}[Description]
Explanation of the example.
\end{example}

\begin{lstlisting}[language=Python, caption=Code example]
def example():
    return "Hello World"
\end{lstlisting}
```

#### Note

```latex
\begin{note}[Note title]
Content of the note.
\end{note}
```

#### Warning

```latex
\begin{warning}[Caution]
Description of a common mistake or pitfall to avoid.
\end{warning}
```

## Custom Commands

### Special Notations

- `\keyword{...}`: Highlights keywords in bold blue
- `\code{...}`: Inline code with gray background
- `\q{...}`: Correct typographic quotes (avoids warnings)
- `\qi{...}`: Quoted italic text
- `\BigO{n}`: Big-O notation, e.g. O(n)
- `\BigOmega{n}`: Big-Omega
- `\BigTheta{n}`: Big-Theta

### Usage Example

```latex
The quicksort algorithm has average complexity \BigO{n \log n}.
The command \code{git commit} saves changes.
The \keyword{recursion} technique is fundamental.
The phrase \q{shared memory} is important.
The term \qi{deadlock} refers to a stalling situation.
```

## Supported Programming Languages

The template supports syntax highlighting for:

- Python
- Java
- C/C++
- JavaScript
- SQL
- Bash/Shell
- Haskell
- and many others

## UTF-8 Support

✅ The template fully supports accented characters inside listings and LaTeX content.

Make sure your `.tex` files are saved in UTF-8 encoding.

Example:

```latex
\begin{lstlisting}[language=Python, caption=Accented characters]
def greet(name):
    """Function that greets a person."""
    print(f"Hello {name}! It's a pleasure to meet you.")

city = "Milan"
age = 25
print(f"City: {city}, Age: {age} years")
\end{lstlisting}
```

## File Organization

```bash
Notes/
├── csnotes.cls           # Class file (do not modify directly unless you know what you do)
├── main.tex              # Main document
├── _chapters/            # Separate chapter files
│   ├── 0_intro.tex
│   ├── 1_chapter1.tex
│   └── 2_chapter2.tex
├── images/               # Images and figures
└── code/                 # External code files
```

### Including External Chapters

```latex
\section{Chapter 1}
\input{_chapters/chapter1}
```

## References and Citations

### Bibliography Example

Add the bibliography resource in your `main.tex` preamble:

```latex
\addbibresource{bibliography.bib}
```

Insert citations in the body, for example:

```latex
As shown in \cite{cormen2009introduction}, common sorting algorithms...
```

Then print the bibliography before `\end{document}`:

```latex
\printbibliography[title={References}]
```

Example `bibliography.bib` entries:

```bibtex
@book{cormen2009introduction,
    title={Introduction to Algorithms},
    author={Cormen, Thomas H. and Leiserson, Charles E. and Rivest, Ronald L. and Stein, Clifford},
    year={2009},
    edition={3rd},
    publisher={MIT Press}
}

@article{dijkstra1959note,
    title={A note on two problems in connexion with graphs},
    author={Dijkstra, Edsger W.},
    journal={Numerische Mathematik},
    volume={1},
    pages={269--271},
    year={1959}
}
```

## Tips

1. Use consistent colors for content types.
2. Keep theorem/note boxes reasonably short to avoid bad page breaks.
3. Use `\keyword{}` for important terms to improve scanability.
4. Organize long documents into separate chapter files with `\input{}`.
5. Comment code listings to explain key steps.

## Build / Compile

### Standard

```bash
pdflatex main.tex
pdflatex main.tex  # Twice for correct references
```

### With Bibliography

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

### Recommended (latexmk)

```bash
latexmk -pdf main.tex
```

## License

Free for personal and academic use.

## Contributing

Feel free to customize and improve the template to suit your needs.
Pull requests are welcome!

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/RiccardoElena"><img src="https://avatars.githubusercontent.com/u/23059036?v=4?s=100" width="100px;" alt="Riccardo Elena"/><br /><sub><b>Riccardo Elena</b></sub></a><br /><a href="#content-RiccardoElena" title="Content">🖋</a> <a href="https://github.com/RiccardoElena/UniNotes_Template/commits?author=RiccardoElena" title="Documentation">📖</a> <a href="#maintenance-RiccardoElena" title="Maintenance">🚧</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/riccardoregina"><img src="https://avatars.githubusercontent.com/u/126416822?v=4?s=100" width="100px;" alt="Riccardo Regina"/><br /><sub><b>Riccardo Regina</b></sub></a><br /><a href="#translation-riccardoregina" title="Translation">🌍</a></td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td align="center" size="13px" colspan="7">
        <img src="https://raw.githubusercontent.com/all-contributors/all-contributors-cli/1b8533af435da9854653492b1327a23a4dbd0a10/assets/logo-small.svg">
          <a href="https://all-contributors.js.org/docs/en/bot/usage">Add your contributions</a>
        </img>
      </td>
    </tr>
  </tfoot>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!