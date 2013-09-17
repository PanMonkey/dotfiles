<<<<<<< HEAD
;; パッケージリスト追加
=======
;; set language Japanese
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Package Manegement
>>>>>>> 99c5be05fbbc5add5898b4e510895637df97a699
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; オートインストール
(require 'cl)
(defvar installing-package-list
  '(
    init-loader
    auto-complete
    helm
    ruby-block
    ruby-electric
    rspec-mode
    powerline
    tabbar
    direx
    popwin
    yasnippet
    ))
(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))


<<<<<<< HEAD
;; ロードパスを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
          (expand-file-name (concat user-emacs-directory path))))
    (add-to-list 'load-path default-directory)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (normal-top-level-add-subdirs-to-load-path))))))
;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elpa" "inits")

;; init-loader
(require 'init-loader)
;; 設定ディレクトリ
(init-loader-load "~/.emacs.d/inits")
;; ログファイルを表示
(setq init-loader-show-log-after-init t)
=======
;; (require 'anything-startup)
(require 'auto-complete)
(require 'auto-complete-config)

;; (require 'linum)

(global-linum-mode t)
(setq linum-format "%3d|")

;; auto-complete
(global-auto-complete-mode t)


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



;-------------------------------------------------------------------------------
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized") 
;; (load-theme 'solarized-dark t) 


(require 'powerline)

(defun arrow-right-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 24 2 1\",
\". c %s\",
\"  c %s\",
\".           \",
\"..          \",
\"...         \",
\"....        \",
\".....       \",
\"......      \",
\".......     \",
\"........    \",
\".........   \",
\"..........  \",
\"........... \",
\"............\",
\"........... \",
\"..........  \",
\".........   \",
\"........    \",
\".......     \",
\"......      \",
\".....       \",
\"....        \",
\"...         \",
\"..          \",
\".           \",
\"            \"};"  color1 color2))



(defun arrow-left-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 24 2 1\",
\". c %s\",
\"  c %s\",
\"           .\",
\"          ..\",
\"         ...\",
\"        ....\",
\"       .....\",
\"      ......\",
\"     .......\",
\"    ........\",
\"   .........\",
\"  ..........\",
\" ...........\",
\"............\",
\" ...........\",
\"  ..........\",
\"   .........\",
\"    ........\",
\"     .......\",
\"      ......\",
\"       .....\",
\"        ....\",
\"         ...\",
\"          ..\",
\"           .\",
\"            \"};"  color2 color1))

(defconst color1 "#6699ff")
(defconst color2 "#ff66ff")
(defconst color3 "#696969")

(defvar arrow-right-1 (create-image (arrow-right-xpm color1 color2) 'xpm t :ascent 'center))
(defvar arrow-right-2 (create-image (arrow-right-xpm color2 color3) 'xpm t :ascent 'center))
(defvar arrow-right-3 (create-image (arrow-right-xpm color3 "None") 'xpm t :ascent 'center))
(defvar arrow-left-1  (create-image (arrow-left-xpm color2 color1) 'xpm t :ascent 'center))
(defvar arrow-left-2  (create-image (arrow-left-xpm "None" color2) 'xpm t :ascent 'center))

(setq-default mode-line-format
 (list  '(:eval (concat (propertize " %* %b " 'face 'mode-line-color-1)
                        (propertize " " 'display arrow-right-1)))
        '(:eval (concat (propertize " %Z " 'face 'mode-line-color-2)
                        (propertize " " 'display arrow-right-2)))
        '(:eval (concat (propertize " %m " 'face 'mode-line-color-3)
                        (propertize " " 'display arrow-right-3)))

        ;; Justify right by filling with spaces to right fringe - 16
        ;; (16 should be computed rahter than hardcoded)
        '(:eval (propertize " " 'display '((space :align-to (- right-fringe 17)))))

        '(:eval (concat (propertize " " 'display arrow-left-2)
                        (propertize " %p " 'face 'mode-line-color-2)))
        '(:eval (concat (propertize " " 'display arrow-left-1)
                        (propertize "%4l:%2c  " 'face 'mode-line-color-1)))
)) 

(make-face 'mode-line-color-1)
(set-face-attribute 'mode-line-color-1 nil
                    :foreground "#fff"
                    :background color1)

(make-face 'mode-line-color-2)
(set-face-attribute 'mode-line-color-2 nil
                    :foreground "#fff"
                    :background color2)

(make-face 'mode-line-color-3)
(set-face-attribute 'mode-line-color-3 nil
                    :foreground "#fff"
                    :background color3)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "#000"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#fff"
                    :background "#000")

;----------------------------------------------------------------------------------
;; tabbar.el
(require 'tabbar)
(tabbar-mode 1)
 
;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)
 
;; グループ化しない
(setq tabbar-buffer-groups-function nil)
 
;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
 
;; ウインドウからはみ出たタブを省略して表示
(setq tabbar-auto-scroll-flag nil)
 
;; タブとタブの間の長さ
(setq tabbar-separator '(1.5))
 
;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family "Comic Sans MS"
 :background "black"
 :foreground "gray72"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected nil
 :background "black"
 :foreground "grey72"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "black"
 :foreground "#c82829"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.2)
 
;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
 '("scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")
(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
 
;; タブ移動キーバインド
;; (global-set-key (kbd "<C-right>") 'tabbar-forward-tab)
;; (global-set-key (kbd "<C-left>") 'tabbar-backward-tab)
(global-set-key (kbd "C-M-n") 'tabbar-forward-tab)
(global-set-key (kbd "C-M-p") 'tabbar-backward-tab)



;; タブモードのオン/オフをトグル
(global-set-key (kbd "M-4") 'tabbar-mode)
 
;; Sort tabbar buffers by name
;; (defun tabbar-add-tab (tabset object &amp;optional append_ignored)
;;  "Add to TABSET a tab with value OBJECT if there isn't one there yet.
;;  If the tab is added, it is added at the beginning of the tab list,
;;  unless the optional argument APPEND is non-nil, in which case it is
;;  added at the end."
;;   (let ((tabs (tabbar-tabs tabset)))
;;     (if (tabbar-get-tab object tabset)
;;         tabs
;;       (let ((tab (tabbar-make-tab object tabset)))
;;         (tabbar-set-template tabset nil)
;;         (set tabset (sort (cons tab tabs)
;;                           (lambda (a b) (string&lt; (buffer-name (car a)) (buffer-name (car b))))))))))
;;--------------------------------------------------------------------------------
;; = ディレクトリツリー表示 =
;; n,        C-n,<down>       direx:next-node              次のノードを選択する
;; p,        C-p,<up>         direx:previous-node          前のノードを選択する
;; C-M-n,    C-M-<down>       direx:next-sibling           次の兄弟ノードを選択する
;; C-M-p,    C-M-<up>         direx:previous-sibling       前の兄弟ノードを選択する
;; ^, C-M-u, C-M-<left>       direx:up-node                親ノードを選択する
;; C-M-d,    C-M-<right>      direx:down-node              最初の子ノードを選択する
;; f                          direx:find-node              そのノードを現在のウィンドウに開く
;; o                          direx:find-node-other-window そのノードを別のウィンドウに開く
;; RET                        direx:maybe-find-node        そのノードをトグルする
;; q                          quit-window                  ウィンドウを閉じる
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(require 'direx)
(setq direx:leaf-icon "  "
      direx:open-icon "- "
      direx:closed-icon "+ ")
(push '(direx:direx-mode :position left :width 40 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)


(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))
(yas-global-mode 1)

(custom-set-variables '(yas-trigger-key "TAB"))

;; anything interface
;;(eval-after-load "anything-config"
;;  '(progn
;;     (defun my-yas/prompt (prompt choices &optional display-fn)
;;       (let* ((names (loop for choice in choices
;;                           collect (or (and display-fn (funcall display-fn choice))
;;                                       choice)))
;;              (selected (anything-other-buffer
;;                         `(((name . ,(format "%s" prompt))
;;                            (candidates . names)
;;                            (action . (("Insert snippet" . (lambda (arg) arg))))))
;;                         "*anything yas/prompt*")))
;;         (if selected
;;             (let ((n (position selected names :test 'equal)))
;;               (nth n choices))
;;           (signal 'quit "user quit!"))))
;;     (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))))
>>>>>>> 99c5be05fbbc5add5898b4e510895637df97a699
