;;; rbs-mode-test --- rbs-mode tests

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

;;; Code:

(load (concat default-directory "rbs-mode.el"))

(defvar rbs-mode--core-type-regexp)

(ert-deftest string-is-core-type ()
  (should (string-match rbs-mode--core-type-regexp "String")))

(ert-deftest string-scanner-is-not-core-type ()
  (should (eql nil (string-match rbs-mode--core-type-regexp "StringScanner"))))

(provide 'rbs-mode-test)
;;; rbs-mode-test.el ends here.
