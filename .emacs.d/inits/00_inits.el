;; set language Japanese
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; (require 'anything-startup)
(require 'auto-complete)
(require 'auto-complete-config)

;; (require 'linum)

(global-linum-mode t)
(setq linum-format "%3d|")

;; auto-complete
(global-auto-complete-mode t)



;; anything
;; (global-set-key (kbd "C-x b") 'anything)
;; (global-set-key (kbd "C-x C-b") 'anything-filelist+)
;; (global-set-key (kbd "M-y") 'anything-show-kill-ring)

;; cua-mode
(cua-mode t)
(setq cua-rectangle-mark-key (kbd "M-SPC"))
(define-key cua-global-keymap cua-rectangle-mark-key 'cua-set-rectangle-mark)
(setq cua-enable-cua-keys nil)

;; キーバインド設定
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; コメントアウト
(define-key global-map (kbd "M-C-g") 'grep)               ; grep
(define-key global-map (kbd "C-M-f") 'next-multiframe-window)     ; 次のウィンドウへ移動
(define-key global-map (kbd "C-M-b") 'previous-multiframe-window) ; 前のウィンドウへ移動


(global-set-key [f12] 'eval-buffer) ;reload


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

;; 前回の終了位置を保存する
;(require 'saveplace)
;(setq-default save-place t)
;(setq save-place-file
;      (convert-standard-filename
;       (concat user-emacs-directory "places")))

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
