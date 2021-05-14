# [![chocolatey](https://img.shields.io/chocolatey/v/zoxide.svg?color=red&label=zoxide)](https://chocolatey.org/packages/zoxide)

> A smarter cd command for your terminal

[![crates.io][crates.io-badge]][crates.io]

`zoxide` is a blazing fast replacement for your `cd` command, inspired by
[`z`][z] and [`z.lua`][z.lua]. It keeps track of the directories you use most
frequently, and uses a ranking algorithm to navigate to the best match.

![Demo][demo.gif]

## Examples

```sh
z foo        # cd into highest ranked directory matching foo
z foo bar    # cd into highest ranked directory matching foo and bar

z ~/foo      # z also works like a regular cd command
z foo/       # cd into relative path
z ..         # cd one level up
z -          # cd into previous directory

zi foo       # cd with interactive selection (using fzf)
```

Read more about the matching algorithm [here][algorithm-matching].

## Getting started

### Step 1: Install `zoxide`

`zoxide` works across all major platforms. If your distribution isn't included
in the list below, you can download the binary from the [Releases] page and
copy it to your `$PATH`.

### Step 2: Install `fzf` (optional)

[`fzf`][fzf] is a command-line fuzzy finder, used by zoxide for interactive
selection. Installation instructions can be found [here][fzf-installation].

### Step 3: Add `zoxide` to your shell

See https://github.com/ajeetdsouza/zoxide#step-3-add-zoxide-to-your-shell for available options.

## Configuration

### `init` flags

- `--cmd`: changes the prefix of predefined aliases (`z`, `zi`).
  - e.g. `--cmd j` would change the aliases to `j` and `ji` respectively.
- `--hook <HOOK>`: change how often zoxide increments a directory's score:
  - `none`: never automatically add directories to zoxide.
  - `prompt`: add the current directory to zoxide at every shell prompt.
  - `pwd`: whenever the user changes directories, add the new directory to
    zoxide.
- `--no-aliases`: don't define extra aliases (`z`, `zi`).
  - These functions will still be available in your shell as `__zoxide_z` and
    `__zoxide_zi`, should you choose to use them elsewhere.

### Environment variables

https://github.com/ajeetdsouza/zoxide#environment-variables

## Third-party integrations

- [nnn], via [autojump plugin][nnn-autojump]
- [xxh], via [xxh-plugin-prerun-zoxide]

[algorithm-matching]: https://github.com/ajeetdsouza/zoxide/wiki/Algorithm#matching
[crates.io-badge]: https://img.shields.io/crates/v/zoxide
[crates.io]: https://crates.io/crates/zoxide
[demo.gif]: https://github.com/ajeetdsouza/zoxide/raw/main/demo.gif
[fzf-installation]: https://github.com/junegunn/fzf#installation
[fzf]: https://github.com/junegunn/fzf
[nnn-autojump]: https://github.com/jarun/nnn/blob/master/plugins/autojump
[nnn]: https://github.com/jarun/nnn
[releases]: https://github.com/ajeetdsouza/zoxide/releases
[xxh-plugin-prerun-zoxide]: https://github.com/xxh/xxh-plugin-prerun-zoxide
[xxh]: https://github.com/xxh/xxh
[z.lua]: https://github.com/skywind3000/z.lua
[z]: https://github.com/rupa/z
