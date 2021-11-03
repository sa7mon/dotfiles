# dotfiles

These are my personal dotfiles. aliases, functions, and options are split into directories according to what they relate to.
Full profiles and resource (rc) scripts are located in `/profiles/`.

### Quick Install

```
git clone https://github.com/sa7mon/dotfiles.git ~/dotfiles/ && if [[ ! -a ~/.zshrc ]]; then cp ~/dotfiles/profiles/default.zshrc ~/.zshrc; fi
```
(Clone the repo and install a default .zshrc if one doesn't exist)
