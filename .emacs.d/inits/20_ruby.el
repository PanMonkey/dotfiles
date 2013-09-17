
;; ruby-mode
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)
;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)
;; rspec-mode
(require 'rspec-mode)
(custom-set-variables '(rspec-use-rake-flag nil))

;;; rcodetool ---------------------------------------------------
; gem install rcodetools
; gem install fastri
; C-c C-c  : 関数・メソッド補完
; C-c C-d  : xmpfilter
; C-c C-f  : riでマニュアルを引く
;; (add-to-list 'load-path "~/.emacs.d/elisp/")

;; (require 'rcodetools)
;; (setq rct-find-tag-if-available nil)
;; (setq rct-get-all-methods-command "PAGER=cat fri -l")

;; (defun make-ruby-scratch-buffer ()
;;   (with-current-buffer (get-buffer-create "*ruby scratch*")
;;     (ruby-mode)
;;     (current-buffer)))
;; (defun ruby-scratch ()
;;   (interactive)
;;   (pop-to-buffer (make-ruby-scratch-buffer)))
;; (defun ruby-mode-hook-rcodetools ()
;;   (define-key ruby-mode-map "\C-c\C-c" 'rct-complete-symbol)
;;   (define-key ruby-mode-map "\C-c\C-d" 'xmp)
;;   (define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
;; (add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

;; $RSENSE_HOMEはRSenseをインストールしたディレクトリのフルパスに置き換えてください

;----------------------------------------------------------------------------------
;                   rsense(ruby補完)
;----------------------------------------------------------------------------------
; 1.rsenseの起動に必要なJREをインストール。
; -------------------------------------------------
; | sudo apt-get install openjdk-7-jre             |
; --------------------------------------------------
; 2.環境設定
; --------------------------------------------------
; | chmod +x ~/.emacs.d/opt/rsense-0.3/bin/rsense  |
; | bin/rsense version                             |
; | >> RSense 0.3                                  |
; | ruby etc/config.rb > ~/.rsense                 |
; --------------------------------------------------
(setq rsense-home (expand-file-name "~/.emacs.d/opt/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
(add-hook 'ruby-mode-hook
          '(lambda ()
             ;; .や::を入力直後から補完開始
             (add-to-list 'ac-sources 'ac-source-rsense-method)
             (add-to-list 'ac-sources 'ac-source-rsense-constant)
             ;; C-x .で補完出来るようキーを設定
             (define-key ruby-mode-map (kbd "C-x .") 'ac-complete-rsense)))

