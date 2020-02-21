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

(require 'ruby-mode)

(defconst ruby-signature-mode--keyword-regexp
  (regexp-opt '("class" "def" "end") t))

(defconst ruby-signature-mode--font-lock-keywords
  '(("\\(class\\|def\\|end\\)" . font-lock-keyword-face)))

;;;###autoload
(define-derived-mode ruby-signature-mode prog-mode "RBS"
  "Major mode for Ruby::Signature."
  ;; (setq-local indent-line-function 'ruby-indent-line)
  (setq-local comment-start "# ")
  (setq-local comment-end "")
  (setq-local font-lock-defaults '((ruby-signature-mode--font-lock-keywords))))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.rbs\\'" . ruby-signature-mode))

(provide 'ruby-signature-mode)
;;; ruby-signature-mode.el ends here
