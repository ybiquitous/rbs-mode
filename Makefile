check:
	emacs --batch			\
		--load ert		\
		--load rbs-mode-test.el \
		--funcall ert-run-tests-batch-and-exit
.PHONY: check
