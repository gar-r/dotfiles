# dotfiles

Personal dotfiles managed by [chezmoi](https://www.chezmoi.io/).

## Usage

Install `chezmoi`, and then add the following to `~/.config/chezmoi/chezmoi.toml`:

```toml
encryption = "gpg"
[gpg]
    symmetric = true
```

Initialize and apply:

```sh
chezmoi init git@github.com:gar-r/dotfiles.git
chezmoi apply
```

In order to auto-bootstrap applications:

```sh
~/scripts/install/all
```
