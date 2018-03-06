(setq inhibit-startup-screen t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (tango)))
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (evil)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBE" :slant normal :weight normal :height 128 :width normal)))))
(require 'package)
(add-to-list 'package-archives
                          '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
    "Install given PACKAGE, optionally requiring MIN-VERSION.
  If NO-REFRESH is non-nil, the available package lists will not be
  re-downloaded in order to locate PACKAGE."
    (if (package-installed-p package min-version)
      t
      (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
        (progn
          (package-refresh-contents)
          (require-package package min-version t)))))

(package-initialize)

(require-package 'evil)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)

;; Numbers column
(global-linum-mode t)
(defvar relative-linum-format-string "%3d")

(add-hook 'linum-before-numbering-hook 'relative-linum-get-format-string)

(defun relative-linum-get-format-string ()
    (let* ((width (1+ (length (number-to-string
                                                             (count-lines (point-min) (point-max))))))
                    (format (concat "%" (number-to-string width) "d")))
          (setq relative-linum-format-string format)))

(defvar relative-linum-current-line-number 0)

(setq linum-format 'relative-linum-relative-line-numbers)

(defun relative-linum-relative-line-numbers (line-number)
    (let ((offset (- line-number relative-linum-current-line-number)))
          (propertize (format relative-linum-format-string offset) 'face 'linum)))

(defadvice linum-update (around relative-linum-update)
             (let ((relative-linum-current-line-number (line-number-at-pos)))
                   ad-do-it))
(ad-activate 'linum-update)

(provide 'relative-linum)

;; Auto-save null
(setq make-backup-files nil)

;; Move between buffers
(define-key evil-normal-state-map (kbd "C-k") 'evil-next-buffer)
(define-key evil-normal-state-map (kbd "C-j") 'evil-prev-buffer)

;; Move between splits
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
