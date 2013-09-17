;;; rspec-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (rspec-enable-appropriate-mode rspec-buffer-is-spec-p
;;;;;;  rspec-dired-mode rspec-verifiable-mode rspec-mode) "rspec-mode"
;;;;;;  "../../../../.emacs.d/elpa/rspec-mode-20130810.1844/rspec-mode.el"
;;;;;;  "fa66eb70292249ee2101b147a2b5ee58")
;;; Generated autoloads from ../../../../.emacs.d/elpa/rspec-mode-20130810.1844/rspec-mode.el

(autoload 'rspec-mode "rspec-mode" "\
Minor mode for RSpec files

\(fn &optional ARG)" t nil)

(autoload 'rspec-verifiable-mode "rspec-mode" "\
Minor mode for Ruby files that have specs

\(fn &optional ARG)" t nil)

(autoload 'rspec-dired-mode "rspec-mode" "\
Minor mode for Dired buffers with spec files

\(fn &optional ARG)" t nil)

(autoload 'rspec-buffer-is-spec-p "rspec-mode" "\
Returns true if the current buffer is a spec

\(fn)" nil nil)

(autoload 'rspec-enable-appropriate-mode "rspec-mode" "\


\(fn)" nil nil)

(dolist (hook '(ruby-mode-hook enh-ruby-mode-hook)) (add-hook hook 'rspec-enable-appropriate-mode))

(add-hook 'rails-minor-mode-hook 'rspec-verifiable-mode)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/rspec-mode-20130810.1844/rspec-mode-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/rspec-mode-20130810.1844/rspec-mode.el")
;;;;;;  (21048 21551 966576))

;;;***

(provide 'rspec-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; rspec-mode-autoloads.el ends here
