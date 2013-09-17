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
    rinari
    ruby-block
    ruby-electric
    rspec-mode
    rhtml-mode
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
