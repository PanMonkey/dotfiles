;;--------------------------------------------------------
;;                      ruby-mode
;;--------------------------------------------------------
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(defun ruby-mode-set-encoding () ())        ;magic commentの無効化
(custom-set-variables
 '(ruby-insert-encoding-magic-comment nil))


;; yaml-mode
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

;;--------------------------------------------------------
;;                     rhtml-mode
;;--------------------------------------------------------
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))

;;--------------------------------------------------------
;;                     rspec-mode
;;--------------------------------------------------------
;; コマンド
;;   C-c s : カーソル行の rspec を実行
(require 'rspec-mode)
(custom-set-variables '(rspec-use-rake-flag nil))

;;--------------------------------------------------------
;;                     ruby-block
;;--------------------------------------------------------
;; ・endとかあるところにカーソル当てたらそれに対応してくれる行をハイライトしてくれたり、minibufferに行を表示してくれたりする
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;;--------------------------------------------------------
;;                   ruby-electric
;;--------------------------------------------------------
;; ・do endの組みとかカッコの組みとかを勝手に挿入してくれる
;; ## たまにうざかったりしたのでコメントアウト ##
;; (require 'ruby-electric)
;; (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;; (setq ruby-electric-expand-delimiters-list nil)

;;--------------------------------------------------------
;;                  rsense(ruby補完)
;;--------------------------------------------------------
;; 1.rsenseの起動に必要なJREをインストール。
;; -------------------------------------------------
;; | sudo apt-get install openjdk-7-jre             |
;; --------------------------------------------------
;; 2.環境設定
;; --------------------------------------------------
;; | chmod +x ~/.emacs.d/opt/rsense-0.3/bin/rsense  |
;; | bin/rsense version                             |
;; | >> RSense 0.3                                  |
;; | ruby etc/config.rb > ~/.rsense                 |
;; --------------------------------------------------
;(setq rsense-home (expand-file-name "~/.emacs.d/opt/rsense-0.3"))
;(add-to-list 'load-path (concat rsense-home "/etc"))
;(require 'rsense)
;(add-hook 'ruby-mode-hook
;          '(lambda ()
;             ;; .や::を入力直後から補完開始
;             (add-to-list 'ac-sources 'ac-source-rsense-method)
;             (add-to-list 'ac-sources 'ac-source-rsense-constant)
;             ;; C-x .で補完出来るようキーを設定
;             (define-key ruby-mode-map (kbd "C-x .") 'ac-complete-rsense)))

;;--------------------------------------------------------
;;                      Rinari
;;--------------------------------------------------------
;; コマンド
;;   C-c ; f f  : RAILS_ROOT/
;;   C-c ; f c  : app/controller/
;;   C-c ; f m  : app/models/
;;   C-c ; f v  : app/views/
;;   C-c ; f h  : app/helper/
;;   C-c ; f i  : db/migrate/
;;   C-c ; f n  : config/
;;   C-c ; f e  : config/environment/
;;   C-c ; f j  : pubic/javascript/
;;   C-c ; f l  : vendor/plugin/
;;   C-c ; f o  : log/
;;   C-c ; f p  : public/
;;   C-c ; f s  : script/
;;   C-c ; f t  : test/
;;   C-c ; f w  : lib/workers/
;;   C-c ; f x  : test/fixtures/
;;   C-c ; f y  : public/stylesheets/
;;   C-c ; f r  : spec/
;;   C-c ; f z  : spec/fixtures
(require 'rinari)
(global-rinari-mode)
