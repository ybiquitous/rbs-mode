# ruby-signature-mode

This is a Emacs major mode for editing [Ruby::Signature](https://github.com/ruby/ruby-signature) code.

## Getting started

1. Download the file where you prefer, e.g. `~/.emacs.d/elisp`.

```shell
curl -L https://raw.githubusercontent.com/ybiquitous/ruby-signature-mode/master/ruby-signature-mode.el \
     -o ~/.emacs.d/elisp/ruby-signature-mode.el
```

2. Setup `ruby-signature-mode` on your Emacs.

```elisp
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'ruby-signature-mode)
```

3. Open your signature file and confirm `ruby-signature-mode` is enabled.

```
class Greeting
  attr_reader name: String

  def initialize: (name: String) -> untyped

  def hi: () -> String
end
```
