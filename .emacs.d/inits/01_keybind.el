;; キーバインド設定
(define-key global-map (kbd "C-c i") 'indent-region)  ; インデント
(define-key global-map (kbd "C-x <up>") 'next-multiframe-window)       ; 次のウィンドウへ移動
(define-key global-map (kbd "C-x <down>") 'previous-multiframe-window) ; 前のウィンドウへ移動

;; (global-set-key [f12] 'eval-buffer) ;reload
