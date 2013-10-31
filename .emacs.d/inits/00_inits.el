;; set language Japanese
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(require 'auto-complete)
(require 'auto-complete-config)

(global-linum-mode t)
(setq linum-format "%3d|")

;; auto-complete
(global-auto-complete-mode t)

;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; cua-mode
(cua-mode t)
(setq cua-rectangle-mark-key (kbd "M-@"))
(setq cua-rectangle-mark-key (kbd "M-SPC"))
(define-key cua-global-keymap cua-rectangle-mark-key 'cua-set-rectangle-mark)
(setq cua-enable-cua-keys nil)

;; ido-mode
(require 'ido)
(ido-mode t)

;; 行末の空白、タブ、全角スペースを可視化する
(defface my-face-tab         '((t (:background "#555555"))) nil :group 'my-faces)
(defface my-face-zenkaku-spc '((t (:background "SteelBlue"))) nil :group 'my-faces)
(defface my-face-spc-at-eol  '((t (:foreground "White" :underline t))) nil :group 'my-faces)
(defvar my-face-tab         'my-face-tab)
(defvar my-face-zenkaku-spc 'my-face-zenkaku-spc)
(defvar my-face-spc-at-eol  'my-face-spc-at-eol)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-tab append)
     ("　" 0 my-face-zenkaku-spc append)
     ("[ \t]+$" 0 my-face-spc-at-eol append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'text-mode-hook
          '(lambda ()
             (progn
               (font-lock-mode t)
               (font-lock-fontify-buffer))))

;; 対応する括弧をハイライト
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match-face nil
                    :background "#999999" :foreground nil)


;; 折り返し表示（標準は折り返さないが、C-c C-lで切り替え可能）
(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)


;; Autosave and Backup
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(if (not (file-directory-p backup-dir))
    (make-directory backup-dir t))
(if (file-directory-p backup-dir)
    (progn
      (setq backup-directory-alist (list (cons ".*" backup-dir)))
      (setq tramp-backup-directory-alist backup-directory-alist))
  (message (concat "Directory does not exist: " backup-dir)))
(if (not (file-directory-p autosave-dir))
    (make-directory autosave-dir t))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


(add-to-list 'load-path
              "~/.emacs.d/yasnippets")
(require 'yasnippet)
(yas-global-mode 1)

(custom-set-variables '(yas-trigger-key "TAB"))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)


;;; color-occur.el
;; 検索結果一覧
;; isearch実行時にM-oを押すと、M-x occur-by-moccurに切り替え
(require 'color-moccur)
;(setq moccur-split-word t) ;スペースで区切られた複数の単語にマッチさせる
(global-set-key "\C-c\C-f" 'moccur-grep-find)
(global-set-key "\C-c\C-g" 'moccur)


;; 試したいパッケージ
;; ctags     ：定義ジャンプ
;; emmet_mode：htmlタグ上部表示
