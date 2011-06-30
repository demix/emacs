(global-set-key [(meta g)] 'goto-line)   ;跳转至第几行
(setq default-major-mode 'text-mode);一打开就起用 text 模式。
(global-font-lock-mode t);语法高亮
(auto-image-file-mode t);打开图片显示功能
(setq-default make-backup-files nil);不生成临时文件
(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no，可能你觉得不需要，呵呵。
(column-number-mode t);显示列号
(show-paren-mode t);显示括号匹配
(display-time-mode 1);显示时间，格式如下
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;(tool-bar-mode nil);去掉那个大大的工具栏;
(scroll-bar-mode nil);去掉滚动条，因为可以使用鼠标滚轮了 ^_^
(mouse-avoidance-mode 'animate) ;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。很好玩阿，这个功能
(setq mouse-yank-at-point t);支持中键粘贴
(transient-mark-mode t);这个忘了，郁闷！
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴
(setq frame-title-format "demix@%b") ;在标题栏提示你目前在什么位置。你要把zhan改成自己的用户名
(setq default-fill-column 80);默认显示 80列就换行 
(setq-default cursor-type 'bar)	 ; 设置光标为竖线 


(setq inhibit-startup-message t);关闭开机画面
;(setq visible-bell t);关闭报错声音


;not tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
;(setq tab-stop-list ())
;(loop for x downfrom 40 to 1 do
;      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

;中文标点
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
;(setq sentence-end-double-space nil)



(defun addToLoadPath(dir)
  (let ((default-directory(concat dir "/")))
    (setq load-path (cons dir load-path))
    (normal-top-level-add-subdirs-to-load-path)
    )
)

(addToLoadPath "~/.emacs.d")


(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

;(require 'linum);显示行号
;(global-linum-mode t)
(global-linum-mode t)


;cedet ecb
(load-file "~/.emacs.d/cedet/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu

(global-set-key [(f5)] 'speedbar-get-focus)
(add-to-list 'load-path
                     "~/.emacs.d/ecb")
(require 'ecb)
(setq ecb-tip-of-the-day nil)  




(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
 



(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")



(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)


(require 'php-mode)



;(require 'flymake-js)
;(add-hook 'javascript-mode-hook 'flymake-js-load)

;(require 'mmm-auto)
;(setq mmm-global-mode 'maybe)
;(mmm-add-mode-ext-class 'javascript-mode "\\.xml\\'" 'javascript-xml)

;(autoload 'bhl-mode "bhl" "BHL Mode" t)
;(add-to-list 'auto-mode-alist '("\\.text$" . bhl-mode))


(speedbar-add-supported-extension ".js")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-name "left8")
 '(ecb-options-version "2.40")
 '(ecb-tree-buffer-style (quote ascii-no-guides))
 '(ecb-tree-expand-symbol-before t)
 '(ecb-use-speedbar-instead-native-tree-buffer nil)
 '(ecb-windows-width 0.2)
 '(js2-indent-on-enter-key t)
 '(nxhtml-default-encoding (quote utf-8))
 '(nxhtml-minor-mode-modes (quote (nxhtml-mode)))
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )




;autocomplete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\M-n" 'ac-next)
(define-key ac-complete-mode-map "\M-p" 'ac-previous)
;(setq ac-auto-start nil)
;(global-set-key "\M-/" 'ac-start)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)


;template
(require 'template)
(template-initialize)

(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))


;nxhtml
;(load "~/.emacs.d/nxhtml/autostart.el")
(add-to-list 'auto-mode-alist '("\\.tpl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.htm$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.xhtml$" . html-mode))


;js2
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;buffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;killing-ring
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)


;zen coding
(require 'zencoding-mode)
;(add-hook 'nxhtml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'zencoding-mode)



;;cc mode
(add-to-list 'load-path "~/.emacs.d/cc-mode")
(require 'cc-mode)
