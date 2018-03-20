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
 '(org-agenda-files (quote ("~/Dropbox/notes/orgzly.org")))
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

;; Toggle between visual-line-mode
(global-set-key (kbd "M-z") 'visual-line-mode)

;; Auto-save null
(setq make-backup-files nil)

;; Move between buffers
(global-set-key (kbd "M-l") 'evil-next-buffer)
(global-set-key (kbd "M-h") 'evil-prev-buffer)

;; Move between splits
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)

;; Open org-agenda
(global-set-key (kbd "C-c a") 'org-agenda-list)

;; Load all org files org-agenda
;; (setq org-agenda-files (list "~/Dropbox/notes"))
;; Shortcuts C-c [ -> add file C-c ] -> remove file

;; Numbers column
(global-linum-mode t)
(eval-when-compile (require 'cl))
(require 'linum)

(defgroup linum-relative nil
          "Show relative line numbers on fringe."
          :group 'convenience)

;;;; Faces
(defface linum-relative-current-face
         '((t :inherit linum :foreground "#CAE682" :background "#444444" :weight bold))
         "Face for displaying current line."
         :group 'linum-relative)

;;;; Customize Variables

(defcustom linum-relative-current-symbol "0"
           "The symbol you want to show on the current line, by default it is 0.
           You can use any string like \"->\". If this variable is empty string,
           linum-releative will show the real line number at current line."
           :type 'string
           :group 'linum-relative)

(defcustom linum-relative-plusp-offset 0
           "Offset to use for positive relative line numbers."
           :type 'integer
           :group 'linum-relative)

(defcustom linum-relative-format "%3s"
           "Format for each line. Good for adding spaces/paddings like so: \" %3s \""
           :type 'string
           :group 'linum-relative)

;;;; Internal Variables

(defvar linum-relative-last-pos 0
    "Store last position.")

;;;; Advices
(defadvice linum-update (before relative-linum-update activate)
           "This advice get the last position of linum."
           (setq linum-relative-last-pos (line-number-at-pos)))

;;;; Functions
(defun linum-relative (line-number)
  (let* ((diff1 (abs (- line-number linum-relative-last-pos)))
         (diff (if (minusp diff1)
                 diff1
                 (+ diff1 linum-relative-plusp-offset)))
         (current-p (= diff linum-relative-plusp-offset))
         (current-symbol (if (and linum-relative-current-symbol current-p)
                           (if (string= "" linum-relative-current-symbol)
                             (number-to-string line-number)
                             linum-relative-current-symbol)
                           (number-to-string diff)))
         (face (if current-p 'linum-relative-current-face 'linum)))
    (propertize (format linum-relative-format current-symbol) 'face face)))

(defun linum-relative-toggle ()
  "Toggle between linum-relative and linum."
  (interactive)
  (if (eq linum-format 'dynamic)
    (setq linum-format 'linum-relative)
    (setq linum-format 'dynamic)))

(setq linum-format 'linum-relative)

(provide 'linum-relative)
;;; linum-relative.el ends here.

