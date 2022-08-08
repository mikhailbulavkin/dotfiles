(add-to-list 'load-path "~/.emacs.d/load")

(require 'package)
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq evil-want-C-u-scroll t)
(add-hook 'comint-mode-hook
      (function (lambda ()
              (local-set-key (kbd "C-d") 'evil-scroll-down))))

(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(setq evil-want-fine-undo 'fine)
(require 'evil)
(evil-mode 1)
(when (require 'evil-collection nil t)
  (evil-collection-init))

(require 'evil-vimish-fold)

(require 'mule)

;; YouCompleteMe
(require 'ycmd)
(add-hook 'c++-mode-hook 'ycmd-mode)
(set-variable 'ycmd-server-command `("python" "-u",(file-truename "~/.emacs.d/ycmd/ycmd/")))
(set-variable 'ycmd-extra-conf-whitelist '("~/*"))

(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
 
(defun ycmd-setup-completion-at-point-function ()
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

(add-hook 'ycmd-mode-hook #'ycmd-setup-completion-at-point-function)

(setq company-ycmd-request-sync-timeout 0.3)
(setq ycmd-parse-conditions '(save new-line mode-enabled idle-change))
(setq ycmd-idle-change-delay 2.0)
(setq ycmd-startup-timeout 15)

(require 'company-ycmd)
(company-ycmd-setup)

(add-hook 'after-init-hook 'global-company-mode)

(defun ycmd-setup-completion-at-point-function ()
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

(add-hook 'ycmd-mode-hook #'ycmd-setup-completion-at-point-function)

(setq flycheck-indication-mode nil)
(when (not (display-graphic-p))
  (setq flycheck-indication-mode nil))


;; -------------


(defun my-hide-all()
  (interactive)
  (hs-minor-mode)
;   (hs-hide-all)
)
(add-hook 'prog-mode-hook 'my-hide-all)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(vs-light))
 '(custom-safe-themes
   '("bf815eb0b3031589aa53b6e01c57fa31e6fd367286204d2c15b6c07173ac63dc" "b06b2483f9fb7bfceb371c8341c0f20e3a38fecd7af7ac1c67bfa028aed9f45c" default))
 '(package-selected-packages
   '(evil-collection vs-light-theme undo-tree flycheck-ycmd evil-vimish-fold company-ycmd)))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
;(tab-bar-mode 1)
;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-linum-mode 1)
(setq inhibit-startup-screen t)
(setq column-number-mode t)
(auto-fill-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-evil-vimish-fold-mode 1)
(setq-default c-basic-offset 4)
(setq initial-scratch-message nil)
; (desktop-save-mode 1)
(show-paren-mode 1)
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
;              (undecorated . t)
              (width . 87) ; chars
              (height . 40) ; lines
              (left . 250)
              (top . 115)))
      (setq default-frame-alist
            '(
;              (undecorated . t)
              (width . 87)
              (height . 40)
              (left . 250)
              (top . 150))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

(setq-default fill-column 80)
(global-display-fill-column-indicator-mode 1)

; Scrolling
(setq scroll-step            1
      scroll-conservatively  10000)

; Tab to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
; Evil-mode tabs
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

; Disable bell
(setq ring-bell-function 'ignore)


(add-to-list 'default-frame-alist '(font . "Source Code Pro 9" ))
(set-face-attribute 'default t :font "Source Code Pro 9" )
(set-fontset-font "fontset-default" 'cyrillic "Source Code Pro 9")
(set-fontset-font "fontset-default" 'greek "Source Code Pro 9")

(setq x-select-enable-clipboard-manager nil)

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun bash-wsl ()
  (interactive)
  (let ((explicit-shell-file-name "C:/Windows/System32/bash.exe"))
    (shell)))

; c/c++ mode identation
(c-add-style "mycodingstyle"
             '((c-comment-only-line-offset . 0)
               (c-hanging-braces-alist . ((substatement-open before
after)))
;               (c-offsets-alist . ((topmost-intro        . 0)
;                                   (topmost-intro-cont   . 0)
;                                   (substatement         . 3)
;                                   (substatement-open    . 0)
;                                   (statement-case-open  . 3)
;                                   (statement-cont       . 3)
;                                   (access-label         . -3)
;                                   (inclass              . 3)
;                                   (inline-open          . 3)
;                                   (innamespace          . 0)
;                                   ))))
(c-offsets-alist . ((arglist-intro . +)
                    (func-decl-cont . ++)
                    (member-init-intro . +)
                    (inher-intro . ++)
                    (comment-intro . 0)
                    (arglist-close . 0)
                    (topmost-intro . 0)
                    (block-open . 0)
                    (inline-open . 0)
                    (substatement-open . 0)
					(statement-cont . 3)
;                     (statement-cont
;                      .
;                      (,(when (fboundp 'c-no-indent-after-java-annotations)
;                          'c-no-indent-after-java-annotations)
;                       ,(when (fboundp 'c-lineup-assignments)
;                          'c-lineup-assignments)
;                       ++))
                    (label . /)
                    (case-label . +)
                    (statement-case-open . +)
                    (statement-case-intro . +) ; case w/o {
                    (access-label . /)
                    (innamespace . -)
					))))

(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "mycodingstyle")
             (setq tab-width 4)
             (setq c-basic-offset tab-width)))

;(setq backup-directory-alist '(("." . "C:\\Users\\bma\\.emacs-backups")))
;(setq backup-by-copying t)
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Unbinding evil insert C-p and C-n for term using
;(with-eval-after-load 'evil-maps
  ;(define-key evil-normal-state-map (kbd "C-n") nil)
  ;(define-key evil-normal-state-map (kbd "C-p") nil)
  ;(define-key evil-insert-state-map (kbd "C-n") nil)
  ;(define-key evil-insert-state-map (kbd "C-p") nil))
  ;(evil-define-key 'term-mode (kbd "C-n") nil))
  ;(define-key evil-insert-state-map (kbd "C-p") nil))

;(setq explicit-shell-file-name "c:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe")
;(setq explicit-powershell.exe-args '("-Command" "-" ))
;(autoload 'powershell "powershell" "Run powershell as a shell within emacs." t) 


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
