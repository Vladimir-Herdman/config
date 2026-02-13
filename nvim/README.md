# Installation

# Configuration
## C/CPP
for clangd, first see if Mason works. If not (like ubuntu container on M1),
follow these instructions below:
- Install clangd through package manager
- Make a soft link of the clangd file to your local mason version (change
    based on where .config is for personal use)
- Make a directory in the mason share packages
    ```bash
    ls -a asdlf
    ln -s /usr/bin/clangd ~/.local/share/nvim/mason/bin/clangd
    mkdir ~/.local/share/nvim/mason/packages/clangd
    ```
