(global-set-key [(meta g)] 'goto-line) ;jump to xx line
(setq default-major-mode 'text-mode)
(global-font-lock-mode t)
(setq-default make-backup-files nil)
(fset 'yes-or-no-p 'y-or-n-p)
(global-linum-mode t)
(show-paren-mode t);显示匹配括号
(display-time-mode 1)
(setq display-time-24hr-format 1)
(setq display-time-day-and-date t)
(mouse-avoidance-mode 'animate)
(setq x-select-enable-clipboard t)
(setq frame-title-format "%b@Demix")
(setq-default cursor-type 'bar);光标为竖线
(setq inhibit-startup-message t);关闭开机
(scroll-bar-mode nil)

(setq default-frame-alist
(append  '((top . 0)(left . 0)(width . 178)(height . 49)) default-frame-alist))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(display-time-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))




;中文标点
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")



(add-to-list 'load-path "~/.emacs.d/")

;php
(require 'php-mode)

;yasinippet
(add-to-list 'load-path
              "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)


(require 'template)
(template-initialize)




;html-mode
(add-to-list 'auto-mode-alist '("\\.tpl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.xhtml$" . html-mode))

;js2-mode https://github.com/mooz/js2-mode/tree/emacs24
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;not tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq c-basic-offset 4)

;html-mode 默认4空格
(add-hook 'html-mode-hook
          (lambda()
            (set (make-local-variable 'sgml-basic-offset) 4)))
