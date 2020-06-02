# rbs-mode

This is a Emacs major mode for editing [Ruby type signatures](https://github.com/ruby/rbs).

![Screenshot](screenshot.png)

## Getting started

1. Download the file where you prefer, e.g. `~/.emacs.d/elisp`.

```shell
curl -L https://raw.githubusercontent.com/ybiquitous/rbs-mode/master/rbs-mode.el \
     -o ~/.emacs.d/elisp/rbs-mode.el
```

2. Setup `rbs-mode` on your Emacs.

```elisp
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'rbs-mode)
```

3. Open your signature file and confirm `rbs-mode` is enabled.

```
class Greeting
  attr_reader name: String

  def initialize: (name: String) -> untyped

  def hi: () -> String
end
```
