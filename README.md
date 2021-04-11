# rbs-mode

This is a Emacs major mode for editing [Ruby type signatures](https://github.com/ruby/rbs) (RBS).

![Screenshot](screenshot.png)

## Getting started

1. Download the elisp file as follows:

```shell
curl -L https://raw.githubusercontent.com/ybiquitous/rbs-mode/master/rbs-mode.el -o ~/.emacs.d/elisp/rbs-mode.el
```

2. Setup `rbs-mode` on your Emacs as follows:

```elisp
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'rbs-mode)
```

3. Open your signature file and <kbd>M-x rbs-mode</kbd>, e.g. [example.rbs](example.rbs).
