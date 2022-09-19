# fzf-tmux.kak
A kakoune plugin that uses tmux popup windows as an interface for fzf

![fzf-tmux](https://user-images.githubusercontent.com/9307830/191073690-b305f52d-47fd-4c8f-8824-fb3dd5a4c210.gif)

## Dependencies:
- [tmux](https://github.com/tmux/tmux) > 3.2 used to display pop up window
- [fzf](https://github.com/junegunn/fzf) for fuzzy finding results in the popup window
- [fd](https://github.com/sharkdp/fd) for feeding files to fzf and respecting gitignore
- [clp](https://jeskin.net/blog/clp/) for file previewing

Provides the following commands:

- `fzf-tmux-file`: Open a file with fzf
- `fzf-tmux-buffer`: Open a buffer with fzf

## Installation

### [plug.kak](https://github.com/andreyorst/fzf.kak)

``` kak
plug "jpe90/fzf-tmux.kak"
```

### [Manual](https://github.com/mawww/kakoune/wiki/Installing-Plugins)

```bash
git clone https://github.com/jpe90/fzf-tmux.kak ~/.config/kak/autoload/fzf-tmux
```

## Post-installation

You can add bindings to the provided commands in your user keymap that are only available when tmux is loaded:
```kak
hook global ModuleLoaded tmux %{
	map global user p ': fzf-tmux-file<ret>' -docstring 'Open a file with fzf'
	map global user b ': fzf-tmux-buffer<ret>' -docstring 'Open a buffer with fzf'
}
```

## Contributions

Contributions are welcome! Feel free to send a PR on Github or a patch via email.
