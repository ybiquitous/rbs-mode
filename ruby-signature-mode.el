;;; ruby-signature-mode.el --- Major mode for Ruby::Signature  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Masafumi Koba

;; Author: Masafumi Koba <koba@ybiquitous-mbp.local>
;; Keywords: languages
;; URL: https://github.com/ybiquitous/ruby-signature-mode
;; Package-Requires: ((emacs "24.3"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Usage:
;;
;;   (require 'ruby-signature-mode)

;;; Code:

(defconst ruby-signature-mode--keywords
  '("alias"
    "attr_accessor"
    "attr_reader"
    "attr_writer"
    "class"
    "def"
    "end"
    "extend"
    "extension"
    "include"
    "interface"
    "module"
    "prepend"
    "private"
    "public"
    "singleton"
    "type"))

(defconst ruby-signature-mode--keywords-regexp
  (regexp-opt ruby-signature-mode--keywords 'symbols))

(defconst ruby-signature-mode--base-types
  '("bool"
    "false"
    "instance"
    "nil"
    "self"
    "top"
    "true"
    "untyped"
    "void"))

(defconst ruby-signature-mode--base-types-regexp
  (regexp-opt ruby-signature-mode--base-types 'symbols))

(defconst ruby-signature-mode--builtin-types
  '("Array"
    "BasicObject"
    "Exception"
    "FalseClass"
    "Float"
    "Hash"
    "Integer"
    "Kernel"
    "NilClass"
    "Numeric"
    "Object"
    "Regexp"
    "RuntimeError"
    "StandardError"
    "String"
    "TrueClass"))

(defconst ruby-signature-mode--builtin-types-regexp
  (regexp-opt ruby-signature-mode--builtin-types 'symbols))

(defconst ruby-signature-mode--declarations-regexp
  (concat (regexp-opt '("class" "extension" "interface" "module" "type") 'symbols) " +\\([^ ]+\\)"))

(defconst ruby-signature-mode--font-lock-keywords
  `((,ruby-signature-mode--keywords-regexp 1 font-lock-keyword-face)
    (,ruby-signature-mode--base-types-regexp 1 font-lock-builtin-face)
    (,ruby-signature-mode--builtin-types-regexp 1 font-lock-type-face)
    (,ruby-signature-mode--declarations-regexp 2 font-lock-type-face)
    ("def +\\(self\\??\\.\\)?\\([^ ]+\\):" 2 font-lock-function-name-face)
    ("alias +\\([^ ]+\\)" 1 font-lock-function-name-face)
    ("#.*$" 0 font-lock-comment-face t)))

;;;###autoload
(define-derived-mode ruby-signature-mode prog-mode "RBS"
  "Major mode for Ruby::Signature."
  ;; (setq-local indent-line-function 'ruby-indent-line)
  (setq-local comment-start "# ")
  (setq-local comment-end "")
  (setq-local font-lock-defaults '(ruby-signature-mode--font-lock-keywords)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.rbs\\'" . ruby-signature-mode))

(provide 'ruby-signature-mode)
;;; ruby-signature-mode.el ends here
