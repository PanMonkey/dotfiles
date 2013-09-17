
(when (require 'helm-config nil t)
;;  (global-set-key (kbd "C-;") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-mini)
  (global-set-key (kbd "M-r") 'helm-resume)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)

  (helm-mode 1)
;;  (helm-dired-bindings when)

;;  ( (require 'gist nil t)
;;    (when (require 'helm-gist nil t)
;;      ))
;;  (when (require 'helm-git nil t)
;;    (global-set-key (kbd "C-x C-g") 'helm-git-find-files)
;;    )
  (when (require 'helm-ls-git nil t)
    )
  (when (require 'helm-themes nil t)
    )
;;  (when (require 'helm-c-moccur nil t)
;;    (global-set-key (kbd "M-o") 'helm-c-moccur-occur-by-moccur)
;;    (global-set-key (kbd "C-M-o") 'helm-c-moccur-dmoccur)
;;    (add-hook 'dired-mode-hook
;;              '(lambda ()
;;                 (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))
;;    (global-set-key (kbd "C-M-s") 'helm-c-moccur-isearch-forward)
;;    (global-set-key (kbd "C-M-r") 'helm-c-moccur-isearch-backward)
;;    )
  ;; (when (require 'helm-gtags nil t)
  ;;   (add-hook 'helm-gtags-mode-hook
  ;;             '(lambda ()
  ;;                (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
  ;;                (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
  ;;                (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
  ;;                (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))
  ;;   )
  ;; (when (require 'helm-descbinds nil t)
  ;;   (helm-descbinds-install)
  ;;   )
  (when (require 'helm-migemo nil t)
    (define-key global-map [(control ?:)] 'helm-migemo)
    )
)

