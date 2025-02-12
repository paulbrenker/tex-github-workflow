# An automated development environment for LaTeX projects

This repository is providing a template with project settings for VSCode and a GitHub Actions setup that makes collaborative development on LaTeX documents easy.

> :bulb: Perfect for managing academic papers or a thesis. :-D

It features configurations for automatic builds in VSCode with a possible split screen view and builds on save. For every merge to the git main branch in the remote repository a release with PDF documents is provided in the release section of the GitHub repository.

Using this template simplifies a long setup, and you can start writing LaTeX Code out of the box.

## Table of Contents

## Prerequisites

This LaTeX setup uses VSCode and uses a Docker image to build the LaTeX PDFs. Make sure you install Docker Desktop and VSCode on your local machine:

|                | Windows                                                                              | MacOS                                                                            | Linux                                                                      |
| -------------- | ------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| Docker Desktop | [Installation Guide](https://docs.docker.com/desktop/setup/install/windows-install/) | [Installation Guide](https://docs.docker.com/desktop/setup/install/mac-install/) | [Installation Guide](https://docs.docker.com/desktop/setup/install/linux/) |
| VSCode         | [Download Link](https://code.visualstudio.com/)                                      | [Download Link](https://code.visualstudio.com/)                                  | [Download Link](https://code.visualstudio.com/)                            |

Pull the latest version of the Tex-Live Docker Image to your local machine. This can take a couple of minutes a strong internet connection is advised:

### Windows

```bash
docker pull ghcr.io/xu-cheng/texlive-full:latest
```

### MacOS (Apple Silicon)

```bash
docker pull --platform linux/amd64 ghcr.io/xu-cheng/texlive-full:latest
```

### Linux

```bash
docker pull ghcr.io/xu-cheng/texlive-full:latest
```

## Setup

Now we need to setup the environment to work seemlessly.

### Clone Git Repository

Navigate to the directory you want to clone the git repository into and execute:

```bash
git clone git@github.com:paulbrenker/tex-github-workflow.git
```

Open your VSCode app and open the git repository there.

### Installing recommended VSCode extensions:

VSCode will recommend two that are specified in the file `.vscode/extensions.json`

- **LaTeX Workshop:** LaTeX typesetting with preview, compile, autocomplete, colorize, and more. (must be installed)
- **LTex:** offline grammar and spell checking using LanguageTool (LT).

### Create your LaTeX project

Create a `.tex` file in the `root` directory. Writing correct latex code is up to you.

> :warning: the template is configured so that the main LaTeX Files are in the `root` directory.

## Usage

### Make a Pull Request

> :warning: If your respository is private the integration checks for commits are using your GitHub Actions minutes.

Check out a new branch:

```bash
git checkout -b my-first-branch
```

Commit your changes:

```bash
git add . && git commit -m 'my first commit'
```

Push your changes to the remote repository:

```bash
git push --set-upstream
```

Open your GitHub Repository and create your first PR. To check that your changes were correct LaTeX code each document in the repository is build. If there are build failures the commit checks will fail.

### Merge your first Version of the Document

After merging your PR a Release with the PDF of your Document is built and made available in the Release section.

## Improvements

This workflow was created on the side of my bachelor thesis. I hope you find it useful. Please let me know your feedback at [paul.brenker@gmail.com](mailto:paul.brenker@gmail.com).

### Further Extension of LaTeX build

If you want to dynamically load images plots or diagrams into your LaTeX projects, and you might change the code or diagrams in the future consider building them inside the CI/CD Pipelines. A working example will be available in the branch `artifacts`.

## Todo before publishing

- [ ] Test for compatibility with multi file latex projects
- [ ] Make a release pipeline
- [ ] Make a preview file for Latex PDFs
- [ ] Make table of contents for README
- [ ] Recommend in README to shorten retention time for artifacts as not needed for long
