# rbs-mode

This is a Emacs major mode for editing [RBS](https://github.com/ruby/rbs) (a type signature language for Ruby).

![Screenshot](screenshot.png)

## Getting started

1. Download this package's elisp file as follows:

```shell
curl -L https://raw.githubusercontent.com/ybiquitous/rbs-mode/HEAD/rbs-mode.el -o ~/.emacs.d/elisp/rbs-mode.el
```

2. Setup `rbs-mode` on your Emacs as follows:

```elisp
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'rbs-mode)
```

3. Open a RBS file, e.g. [`core/object.rbs`](https://github.com/ruby/rbs/blob/42c4f166589e6ec60ea82824118ce2b6e9235fe8/core/object.rbs).

## Contributing

Welcome to your contribution! Feel free to open an issue or pull request.
