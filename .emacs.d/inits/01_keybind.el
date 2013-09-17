;; キーバインド設定
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; コメントアウト
(define-key global-map (kbd "M-C-g") 'grep)               ; grep
(define-key global-map (kbd "C-M-f") 'next-multiframe-window)     ; 次のウィンドウへ移動
(define-key global-map (kbd "C-M-b") 'previous-multiframe-window) ; 前のウィンドウへ移動


(global-set-key [f12] 'eval-buffer) ;reload
