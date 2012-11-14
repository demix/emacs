Emacs Config 
============


1. auto-complete must be re-install
download at http://cx4a.org/software/auto-complete/
in emacs M-x load-file to etc/install.el

2. php-mode may throw error
replace (require 'php-mode)
to 
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
http://stackoverflow.com/questions/898063/making-php-mode-and-other-cc-mode-derived-modes-compatible-with-emacs-23
