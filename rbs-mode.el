;;; rbs-mode.el --- Major mode for Ruby::Signature  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Masafumi Koba

;; Author: Masafumi Koba
;; Keywords: languages
;; URL: https://github.com/ybiquitous/rbs-mode
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
;;   (require 'rbs-mode)

;;; Code:
(require 'rx)

(defconst rbs-mode--keywords
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
    "super"
    "type"))

(defconst rbs-mode--base-types
  '("bool"
    "bot"
    "false"
    "instance"
    "nil"
    "self"
    "top"
    "true"
    "untyped"
    "void"))

(defconst rbs-mode--builtin-types
  '("ArgumentError"
    "Array"
    "BasicObject"
    "BigDecimal"
    "Binding"
    "Class"
    "Comparable"
    "Complex"
    "Dir"
    "ENV"
    "Encoding"
    "EncodingError"
    "Enumerable"
    "Enumerator"
    "Errno"
    "Exception"
    "FalseClass"
    "File"
    "Float"
    "Hash"
    "IndexError"
    "Integer"
    "IO"
    "Kernel"
    "Logger"
    "Method"
    "Module"
    "NameError"
    "NilClass"
    "Numeric"
    "Object"
    "Pathname"
    "Proc"
    "Process"
    "Process::Status"
    "Random"
    "Random::Formatter"
    "Range"
    "RangeError"
    "Rational"
    "Regexp"
    "RuntimeError"
    "ScriptError"
    "SignalException"
    "StandardError"
    "String"
    "Struct"
    "Symbol"
    "SystemCallError"
    "Thread"
    "ThreadGroup"
    "Time"
    "TracePoint"
    "TrueClass"
    "UnboundMethod"))

(defconst rbs-mode--declarations-regexp
  (rx (or "class" "extension" "interface" "module" "type") (1+ space) (group (1+ (any alnum "_" ":")))))

(defconst rbs-mode--inheritance-regexp
  (rx (1+ space) (any "<" ":") (1+ space) (group (1+ (any alnum "_" ":")))))

(defconst rbs-mode--method-name-regexp
  (rx word-boundary "def" (1+ space) (opt "self" (opt "?") ".") (group (1+ (any alnum "_" "?"))) ":"))

(defconst rbs-mode--alias-name-regexp
  (rx word-boundary "alias" (1+ space) (opt "self" (opt "?") ".") (group (1+ (any alnum "_" "?"))) (1+ space)))

(defconst rbs-mode--constant-regexp
  ;; Include a global variable
  (rx (0+ space) (group (opt "$") (1+ (any alnum "_" ":"))) ":" (1+ space)))

(defconst rbs-mode--comment-regexp
  (rx "#" (0+ not-newline) eol))

(defconst rbs-mode--font-lock-keywords
  `((,(regexp-opt rbs-mode--keywords 'symbols) (1 font-lock-keyword-face))
    (,rbs-mode--constant-regexp (1 font-lock-constant-face))
    (,rbs-mode--declarations-regexp (1 font-lock-type-face))
    (,rbs-mode--inheritance-regexp (1 font-lock-type-face))
    (,rbs-mode--method-name-regexp (1 font-lock-function-name-face))
    (,rbs-mode--alias-name-regexp (1 font-lock-function-name-face))
    (,(regexp-opt rbs-mode--base-types 'words) (1 font-lock-builtin-face))
    (,(regexp-opt rbs-mode--builtin-types 'words) (1 font-lock-type-face))
    (,rbs-mode--comment-regexp (0 font-lock-comment-face t))))

;;;###autoload
(define-derived-mode rbs-mode prog-mode "RBS"
  "Major mode for Ruby::Signature."
  ;; (setq-local indent-line-function 'ruby-indent-line)
  (setq-local comment-start "# ")
  (setq-local comment-end "")
  (setq-local font-lock-defaults '(rbs-mode--font-lock-keywords)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.rbs\\'" . rbs-mode))

(provide 'rbs-mode)
;;; rbs-mode.el ends here