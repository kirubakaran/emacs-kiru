(message "*****  .emacs loading  *****")

; -------------------- stevey bgn --------------------
 
(defvar emacs-root 
  (if (eq system-type 'windows-nt)
      "C:/users/kirath/"
      "~/"))

(add-to-list 'load-path (concat emacs-root "emacs"))

(require 'cl)

;(global-set-key "\C-x\C-m" 'execute-extended-command) ;use chord xm

;(define-key global-map [f8] 'kill-region) ;use chord fk
(global-set-key "\C-w" 'backward-kill-word)

;; (define-key global-map [f9] 'switch-to-scratch)
;; (defun switch-to-scratch ()
;;   (interactive)
;;   (switch-to-buffer "*scratch*"))

(define-key global-map [f9] 
  (lambda ()
    (interactive)
    (switch-to-buffer "*scratch*")
    )
  )

;(global-set-key "\C-w" 'my-custom-kill)
;(defun my-custom-kill ()
;  (interactive "p")
;  (if mark-active
;      'kill-region
;    'backward-kill-word))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))
 

(global-set-key [f5] 'call-last-kbd-macro)

; -------------------- stevey end --------------------

; git

; http://www.emacswiki.org/cgi-bin/wiki/Git
;; (if (eq system-type 'windows-nt)
;;     (progn
;;       (require 'magit)
;;       (define-key global-map [f6] 'magit-status))
;;     (progn
;;       (message "i am loading git")
;;       (add-to-list 'load-path (expand-file-name "/usr/share/doc/git-core/contrib/emacs"))
;;       (require 'vc-git)
;;       (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
;;       (require 'git)
;;       (autoload 'git-blame-mode "git-blame"
;;         "Minor mode for incremental blame for Git." t)))

(require 'magit)
(define-key global-map [f6] 'magit-status)


; tab
; http://student.northpark.edu/pemente/emacs_tabs.htm
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)


; http://www.emacs.uniyar.ac.ru/doc/em24h/emacs100.htm
(setq show-paren-mode t)
(setq show-paren-style 'parenthesis)

; --- to learn from ---
; http://www.emacswiki.org/cgi-bin/wiki/emacs-init.el
; this url seems to be a good resource
(setq inhibit-startup-message t)


; http://homepages.inf.ed.ac.uk/s0243221/emacs/
; http://tldp.org/HOWTO/Emacs-Beginner-HOWTO-4.html
(defun alt-colors-1 ()
  (progn
     (set-cursor-color "Orchid")
     (set-mouse-color "Orchid")
     (set-background-color "DarkSlateGray")
     (set-foreground-color "Wheat")
     (global-hl-line-mode 1)
	 ))

; lines
(setq scroll-step 1) 
(line-number-mode 1)
(column-number-mode 1)

; backup 
(setq make-backup-files t)
(setq version-control t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
; ----------------------------------------

; paren hilite
; http://www.emacsblog.org/2007/08/07/quick-tip-show-paren-mode/
(show-paren-mode t)
;(setq show-paren-style 'expression)
(setq show-paren-style 'parenthesis)


; http://infolab.stanford.edu/~manku/dotemacs.html
(transient-mark-mode t) ; highlight marked region

; http://www.math.umn.edu/~garrett/shortest/emacs_customization.html
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.bmk")
 '(vc-follow-symlinks nil))

(defun alt-colors-2 ()
  (progn
	 (set-background-color "DimGray")
	 (set-foreground-color "LightGray")
	 (set-cursor-color "DarkSlateBlue")
	 (set-border-color "DimGray")
	 (set-mouse-color "DarkSlateBlue")
	 
	 (set-face-background 'default "DimGray")
	 (set-face-background 'region "DarkSlateGray")
	 (set-face-background 'highlight "DarkSlateBlue")
	 (set-face-background 'modeline "DarkSlateBlue") ;;; CornflowerBlue")
	 
	 (set-face-foreground 'default "LightGray")
	 (set-face-foreground 'region "Ivory")
	 (set-face-foreground 'highlight "LightGray")  ;;; DimGray")
	 (set-face-foreground 'modeline "LightGray")
	 ))

(setq-default delete-old-versions 't)
;(alt-colors-2)
(alt-colors-1)
(dired emacs-root)
(rename-buffer "dired1")
;(shell)
(find-file (concat emacs-root ".emacs"))

; ----------------------------------------
; http://www.zafar.se/bkz/Articles/EmacsTips

(add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)

(defun custom-goto-match-beginning ()
  "Use with isearch hook to end search at first char of match."
  (when isearch-forward (goto-char isearch-other-end)))
; ----------------------------------------

(setq resize-minibuffer-mode t)

; ----------------------------------------
; http://www.emacswiki.org/cgi-bin/wiki/EmacsNiftyTricks#toc3
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

(fset 'yes-or-no-p 'y-or-n-p)

;repl for elisp
(ielm)

; ----------------------------------------

; http://common-lisp.net/project/slime/doc/html/Installation.html#Installation
; slime

; installation: 
; apt-get install sbcl sbcl-doc sbcl-source slime

; bookmark: [transcript of marco baringer's slime movie]
; http://www.pchristensen.com/blog/articles/reference-for-the-slimelispemacs-screencast/#comment-144

(if (eq system-type 'windows-nt)
    (progn
;      (message "i am starting slime")
;      (setq inferior-lisp-program "C:/sbcl-1.0.19/sbcl.exe --core C:/sbcl-1.0.19/sbcl.core")
;      (add-to-list 'load-path "C:/slime")
;      (require 'slime)
;      (slime-setup)
;      (slime-setup '(slime-fancy slime-asdf))
;      (slime)
;      (setq slime-startup-animation nil)
      )
  (progn
      (message "i am starting slime")
      (setq inferior-lisp-program "/usr/bin/sbcl")
      (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime")
      (require 'slime)
      (slime-setup)
      (slime-setup '(slime-fancy slime-asdf))
      ;(slime-setup '(slime-fancy slime-asdf slime-js))
      (slime)
      ; http://www.jasondunsmore.com/emacs/dotemacs.txt
      (setq slime-startup-animation nil)))

; color theme
; http://www.emacswiki.org/cgi-bin/wiki?ColorTheme
; http://www.cs.cmu.edu/~maverick/GNUEmacsColorThemeTest/

;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-robin-hood)
;(color-theme-subtle-hacker)


; w3m
; http://www.emacswiki.org/cgi-bin/emacs-en/emacs-w3m
; http://emacs-w3m.namazu.org/
; note : worked when i used the dev branch instead of the stable branch for w3m.el
(if (eq system-type 'windows-nt)
    (message "i am skipping w3m")
  (progn
    (message "i am starting w3m")
    ;(add-to-list 'load-path  (concat emacs-root "emacs/emacs-w3m-1.4.4"))
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m")
    (require 'w3m-load)
    (setq browse-url-browser-function 'w3m-browse-url)
    (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
    (global-set-key "\C-xm" 'browse-url-at-point)))


;(define-key global-map [f11] 'hexl-find-file)
;(define-key global-map [f12] 'compare-windows)
(global-set-key [kp-subtract] "\C-a\C-k\C-d") ; numpad minus = nuke line


; auto encryption - begin
; http://www.emacswiki.org/cgi-bin/wiki/AutoEncryption
(defvar pgg-gpg-user-id "kirubakaran")
(autoload 'pgg-make-temp-file "pgg" "PGG")
(autoload 'pgg-gpg-decrypt-region "pgg-gpg" "PGG GnuPG")
(define-generic-mode 'gpg-file-mode
  (list ?#) 
  nil nil
  '(".gpg\\'" ".gpg-encrypted\\'")
  (list (lambda ()
	    (add-hook 'before-save-hook
                      (lambda () 
                        (let ((pgg-output-buffer (current-buffer)))
                          (pgg-gpg-encrypt-region (point-min) (point-max)
                                                  (list pgg-gpg-user-id))))
                      nil t)
	    (add-hook 'after-save-hook 
		      (lambda ()
                        (let ((pgg-output-buffer (current-buffer)))
                          (pgg-gpg-decrypt-region (point-min) (point-max)))
			(set-buffer-modified-p nil)
			(auto-save-mode nil))
		      nil t)
            (let ((pgg-output-buffer (current-buffer)))
              (pgg-gpg-decrypt-region (point-min) (point-max)))
	    (auto-save-mode nil)
	    (set-buffer-modified-p nil)))
  "Mode for gpg encrypted files")
; auto encryption - end

; ----------------------------------------
; set window title to contain the current buffer name
; this is so that rescue-time can see what buffer I am in
; I don't want everything I do in emacs to be classified as 'dev work'

;(defadvice switch-to-buffer (after name-the-frame (arg))
;  (set-frame-name (concat (buffer-name) " - emacs")))
;  
;(ad-activate 'switch-to-buffer)

; a method that wasn't sufficient:
;(global-set-key [f10] 
;                '(lambda ()
;                   (interactive)
;                   (set-frame-name (concat "emacs : " (buffer-name)))))

; a method that didn't work:
;(global-set-key "\C-xb" 
;                '(lambda (buffer &optional norecord)
;                     (interactive)
;                     (set-frame-name (concat "emacs : " (buffer-name)))
;                     (switch-to-buffer buffer norecord)))

; references:
; http://www.gnu.org/software/emacs/elisp/html_node/Advising-Functions.html#Advising-Functions
; http://groups.google.com/group/gnu.emacs.help/browse_thread/thread/9e50dd3a196c86c8

; ----------------------------------------

(split-window-horizontally)

; cygwin
; http://www.khngai.com/emacs/cygwin.php
(if (eq system-type 'windows-nt)
   (progn
     (setenv "PATH" (concat (getenv "PATH") ";C:\\users\\kirath\\cygwin\\bin"))
     (setq exec-path (cons "c:/users/kirath/cygwin/bin/" exec-path))
     (require 'cygwin-mount)
     (cygwin-mount-activate)
     
     ; Replace DOS shell with Cygwin Bash Shell
     (add-hook 'comint-output-filter-functions
               'shell-strip-ctrl-m nil t)
     (add-hook 'comint-output-filter-functions
               'comint-watch-for-password-prompt nil t)
     (setq explicit-shell-file-name "bash.exe")
     ;; For subprocesses invoked via the shell
     ;; (e.g., "shell -c command")
     (setq shell-file-name explicit-shell-file-name)))

; ------------------------------------------------------------
; python mode
; http://www.emacswiki.org/cgi-bin/wiki/PythonMode
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (define-key python-mode-map "\"" 'electric-pair)
;;             (define-key python-mode-map "\'" 'electric-pair)
;;             (define-key python-mode-map "(" 'electric-pair)
;;             (define-key python-mode-map "[" 'electric-pair)
;;             (define-key python-mode-map "{" 'electric-pair)))

;; (defun electric-pair ()
;;   "Insert character pair without sournding spaces"
;;   (interactive)
;;   (let (parens-require-spaces)
;;     (insert-pair)))
; ------------------------------------------------------------

; ------------------------------------------------------------
; open my files

;; (message "i am loading files from thumb drive")

;; (defun thumbdrive ()
;;   (if (eq system-type 'windows-nt)
;;       '"f:/"
;;     '"/media/HANZO\ SWORD/"))

;; (defun open-file-if-exists (file1)
;;   (when (file-readable-p file1)
;;     (find-file file1)))

;; (defun oife (file1)
;;   (open-file-if-exists (concat (thumbdrive) "Performance/" file1)))

;; (mapc 'oife
;;       (list
;;        "done.txt"
;;        "goals.txt"
;;        "ideas.txt"
;;        "startup-log.txt"
;;        "try-new-habits.org"
;;        "todo.txt"))

; ------------------------------------------------------------

(defun my-date ()
  (interactive)
  (insert
   (my-date-str)))

(defun my-date-str ()
  (concat "[" (format-time-string "%b %d, %Y %H:%M") "] "))

(defun my-time ()
  (interactive)
  (insert
   (my-time-str)))

(defun my-time-str ()
  (concat "[" (format-time-string "Time %H:%M") "] "))

(define-key global-map [f3] 'my-time)
(define-key global-map [S-f3] 'my-date)

; ------------------------------------------------------------

; ---
; copy line without selection
; http://www.emacswiki.org/cgi-bin/wiki/CopyWithoutSelection
(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (let ((beg (line-beginning-position)) 
     	(end (line-end-position arg)))
    (copy-region-as-kill beg end)))

(global-set-key (kbd "C-c l") 'copy-line)
; ---

(defun totd ()
  (interactive)
  (random t) ;; seed with time-of-day
  (with-output-to-temp-buffer "*Tip of the day*"
    (let* ((commands (loop for s being the symbols
                           when (commandp s) collect s))
           (command (nth (random (length commands)) commands)))
      (princ
       (concat "Your tip for the day is:\n"
               "========================\n\n"
               (describe-function command)
               "\n\nInvoke with:\n\n"
               (with-temp-buffer
                 (where-is command t)
                 (buffer-string)))))))

(totd)

; ------------------------------------------------------------
; http://mail.python.org/pipermail/python-list/2007-October/464038.html
(defun my-file-processing-fn (fpath)
  "\nelisp file processing function. \nKill word that occurs after kite and hoo. \n~Kirubakaran\n"
  (interactive)
  (let (mybuffer)
    (setq mybuffer (find-file fpath))
    (search-forward "kite")
    (search-forward "hoo")
    (kill-word (point))
    (save-buffer)
    (kill-buffer mybuffer)))
; ------------------------------------------------------------

; ------------------------------------------------------------
; http://www3.ntu.edu.sg/home5/pg04878518/EmacsTools.html

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)

;(require 'browse-kill-ring)
;(global-set-key [(control c)(k)] 'browse-kill-ring)
;(browse-kill-ring-default-keybindings)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;commenting coz this only turned out to be a nuisance in my non-lisp coding
;(global-set-key "%" 'match-paren)

(require 'generic)
(require 'generic-x)

(if (not (eq system-type 'windows-nt))
    (setq x-select-enable-clipboard 't))

(autoload 'gtypist-mode "gtypist-mode")
(setq auto-mode-alist
      (cons '("\\.typ\\'" . gtypist-mode) auto-mode-alist))

; ------------------------------------------------------------

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  
(if (eq system-type 'windows-nt)
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(default ((t 
                 (:stipple nil 
                  :background "DarkSlateGray" 
                  :foreground "Wheat" 
                  :inverse-video nil 
                  :box nil 
                  :strike-through nil 
                  :overline nil 
                  :underline nil 
                  :slant normal 
                  :weight normal 
                  :height 140 
                  :width normal 
                  :family "outline-consolas"))))))

(require 'python-mode)
;(require 'ipython)
(setq py-shell-name "ipython")
(setq ipython-command "/usr/bin/ipython")

;(setq py-python-command-args '("-pylab" "-colors" "LightBG"))
;(setq-default py-python-command-args '("--colors=LightBG"))
(setq-default py-python-command-args '("--colors=Linux"))


;experimental
;(add-to-list 'load-path (concat emacs-root "emacs/g-client"))
;(load-library "g")


; makes line into
; +------+
; | line |
; +------+

(global-set-key [f7] 'k_box)

(defun k_box ()
  (interactive)
  (setq cur_line (thing-at-point 'line))
  ;delete trailing newline
  (if (string= 
       (substring cur_line -1) 
       "\n")
      (progn
        (setq cur_line 
              (substring cur_line 0 (- (length cur_line) 1)))))
  (setq ins_line (concat "| " cur_line " |\n"))
  (setq border_line 
        (concat "+" 
                (make-string (- (length ins_line) 3) ?-)
                "+"))
  (beginning-of-line)
  (kill-line)
  (insert 
   border_line
   "\n"
   ins_line
   border_line
   "\n"))


;escreen

(load "escreen")
(escreen-install)
(global-set-key (kbd "<s-prior>") 'escreen-goto-prev-screen)
(global-set-key (kbd "<s-next>")  'escreen-goto-next-screen)

(delete-selection-mode t)


; CSS color values colored by themselves
; http://xahlee.org/emacs/emacs_html.html
(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background 
                     (match-string-no-properties 0)))))))

(defun hexcolour-add-to-font-lockfont-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))

(add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)
; end

;(global-set-key "\C-x\C-b" 'ibuffer) ; was list-buffers ;use chord xb

; make emacs fonts bigger
; :height 100 ===> 10px
; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;(set-face-attribute 'default nil :height 120)

; Use a better font
(when (string= system-name "hulk")
  (set-default-font "Inconsolata-16"))

; Zap-back-to-char
; http://www.reddit.com/r/programming/comments/8lfx7/what_emacs_commands_do_you_use_most_and_find_most/c09p0ut
; kiru : doesn't seem to work
; (global-set-key "\C-\M-z" #'(lambda (arg char) (interactive "p\ncZap to char: ") (zap-to-char (- arg) char)))

(setq eshell-save-history-on-exit t)

; windmove
; http://news.ycombinator.com/item?id=1080253
; http://hovav.net/elisp/
; http://www.emacswiki.org/emacs/WindMove
(windmove-default-keybindings 'control)

; chrome <--> emacs
;(require 'edit-server)
;(edit-server-start)

;(require 'org-babel-init)

;full screen / maximize
;http://ubuntuforums.org/showthread.php?t=782196
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
;(toggle-fullscreen)

;(global-unset-key [left])
;(global-unset-key [right])
;(global-unset-key [up])
;(global-unset-key [down])
;(global-unset-key [prior])
;(global-unset-key [next])
(global-unset-key [home])
(global-unset-key [end])

; ------------------------------------------------------------

; http://stackoverflow.com/questions/1839313/
; key : a
(put 'dired-find-alternate-file 'disabled nil)


; http://www.emacswiki.org/emacs/PrettyControlL
(defvar pp^L-^L-string-function
  (lambda (win) (make-string (1- (window-width win)) ?_)))
(require 'pp-c-l)
(pretty-control-l-mode 1)

(put 'set-goal-column 'disabled nil)

; http://code.google.com/p/yasnippet/
;; (add-to-list 'load-path (concat emacs-root "emacs/plugins/yasnippet-0.6.1c"))
;; (require 'yasnippet)
;; (yas/initialize)
;; (yas/load-directory (concat emacs-root "emacs/plugins/yasnippet-0.6.1c/snippets"))
;; (setq yas/prompt-functions
;;       '(yas/ido-prompt yas/x-prompt))

; ------------------------------------------------------------
; http://www.djcbsoftware.nl/dot-emacs.html

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;; increase minibuffer size when ido completion is active
(add-hook 'ido-minibuffer-setup-hook 
          (function
           (lambda ()
             (make-local-variable 'resize-minibuffer-window-max-height)
             (setq resize-minibuffer-window-max-height 1))))

(global-set-key (kbd "M-g")         'goto-line)

; ------------------------------------------------------------

; http://box.matto.nl/emacsgmail.html

;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; IMAP
(setq elmo-imap4-default-server "imap.gmail.com")
(setq elmo-imap4-default-user "kulalosai@gmail.com") 
(setq elmo-imap4-default-authenticate-type 'clear) 
(setq elmo-imap4-default-port '993)
(setq elmo-imap4-default-stream-type 'ssl)

(setq elmo-imap4-use-modified-utf7 t) 

;; SMTP
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "kulalosai")
(setq wl-smtp-posting-server "smtp.gmail.com")
(setq wl-local-domain "gmail.com")

(setq wl-default-folder "%inbox")
(setq wl-default-spec "%")
(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
(setq wl-trash-folder "%[Gmail]/Trash")

(setq wl-folder-check-async t) 

(setq elmo-imap4-use-modified-utf7 t)

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

; ------------------------------------------------------------

; http://www.djcbsoftware.nl/dot-emacs.html
; restore window configuration
(require 'winner)
(setq winner-dont-bind-my-keys t) ;; winner conflicts with org
(global-set-key (kbd "<s-left>")      'winner-undo)
(global-set-key (kbd "<XF86Forward>") 'winner-redo)
(global-set-key (kbd "<s-right>") 'winner-redo)
(global-set-key (kbd "<XF86Back>") 'winner-undo)
(winner-mode t)

(size-indication-mode t)

;; uniquify: unique buffer names
(require 'uniquify) ;; make buffer names more unique
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":"
  uniquify-after-kill-buffer-p t
  uniquify-ignore-buffers-re "^\\*")

; http://emacs-fu.blogspot.com - same guy as http://www.djcbsoftware.nl/dot-emacs.html
(setq cua-enable-cua-keys nil) ;; only for rectangles
(cua-mode t)

(setq delete-by-moving-to-trash t) ; moves file to ~/.Trash on delete

(setq save-place-file "~/.emacs.d/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
(require 'saveplace)                          ;; get the package

; http://garage.pimentech.net/libcommonDjango_django_emacs/
(autoload 'django-html-mode "django-html-mode")
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\'" . django-html-mode))

;; ; start emacs server
;; ; http://ipython.scipy.org/doc/rel-0.9.1/html/config/initial_config.html
;; (defvar server-buffer-clients)
;; ;(when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
;; (when (fboundp 'server-start)
;;   (server-start)
;;   (defun fp-kill-server-with-buffer-routine ()
;;     (and server-buffer-clients (server-done)))
;;   (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))

; C-a once command beginning and twice to line beginning
; http://www.emacswiki.org/emacs/EshellFunctions
(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
        (beginning-of-line))))
(add-hook 'eshell-mode-hook
          '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-maybe-bol)))


; fixing js2-mode indentation
; bottom of : https://github.com/mitchellh/dotfiles/blob/master/emacs.d/modes.el
; thanks to : http://news.ycombinator.com/item?id=1952346

;; js-mode (espresso)
;; Espresso mode has sane indenting so we use that.
(setq js-indent-level 2)

;; ;; JS2-Mode
;; (add-to-list 'load-path (concat packages-dir "/js2-mode"))
;; (autoload 'js2-mode "js2" nil t)

;; Customize JS2
(setq js2-basic-offset 2)
(setq js2-cleanup-whitespace t)

;; Custom indentation function since JS2 indenting is terrible.
;; Uses js-mode's (espresso-mode) indentation semantics.
;;
;; Based on: http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
;; (Thanks!)
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (js--proper-indentation parse-status))
           node)

      (save-excursion

        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ js-indent-level 2))))

        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-js2-mode-hook ()
  (if (not (boundp 'js--proper-indentation))
      (progn (js-mode)
             (remove-hook 'js2-mode-hook 'my-js2-mode-hook)
             (js2-mode)
             (add-hook 'js2-mode-hook 'my-js2-mode-hook)))
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (message "JS2 mode hook ran."))

;; Add the hook so this is all loaded when JS2-mode is loaded
(add-hook 'js2-mode-hook 'my-js2-mode-hook)

; end js2-mode


;(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))

;http://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  (back-to-indentation)
)
(global-set-key (kbd "C-S-f") 'duplicate-line)

(global-set-key (kbd "C-S-a") 'align-regexp)

(message "*****  .emacs loaded  *****")

(put 'narrow-to-region 'disabled nil)

(require 'highlight-indentation)
(global-set-key "\C-ch" 'highlight-indentation)

;Erlang
;http://parijatmishra.wordpress.com/2008/08/15/up-and-running-with-emacs-erlang-and-distel/
(push "/home/kiru/emacs/distel/elisp" load-path)
(require 'erlang-start)
(require 'distel)
(distel-setup)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;(load-file "/home/kiru/opt/dvc/++build/dvc-load.el")

(require 'dired+)

(global-set-key (kbd "M-/") 'hippie-expand)
(require 'bookmark+)

;; (require 'google)
;; (setq google-license-key "ABQIAAAAX24y9sOWkGb05hZfRXyLqhQMUf-zCmQEDwv1N16oyUFq57qOsBRRq3EREDeLpkl2ki4azX9DIGjX5g" ; optional
;;       google-referer "http://www.kirubakaran.com/") ; required!
;; (google-search-video "rickroll")

; keychord
; http://www.emacswiki.org/emacs/download/key-chord.el
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "xm" 'execute-extended-command)
(key-chord-define-global "xo" 'other-window)
(key-chord-define-global "xb" 'ibuffer)
(key-chord-define-global "fk" 'kill-region)
;(key-chord-define-global "fs" 'save-buffer)
;(key-chord-define-global "fb" 'ido-switch-buffer)

(global-set-key "\C-cr" 'remember)

(defun org_setup ()
  (progn
    (setq org-directory "/home/kiru/Documents/org")
    (setq org-default-notes-file 
          (concat org-directory "/notes.org"))
    (define-key global-map "\C-cc" 'org-capture)
    (define-key global-map "\C-cl" 'org-store-link)
    ;; (add-hook 'org-mode-hook 'visual-line-mode)
    (add-hook 'org-mode-hook 'auto-fill-mode)
    (key-chord-define org-mode-map "fl" 'collapse-to-title-wrap)
    ))

(message "near 23/24 check")
(if (> emacs-major-version 23)
    (progn
      (message "in >23")
      (eval-after-load "org"
        '(progn
           (org_setup)
           )))
  (progn
    (message "in <=23")
    (require 'org)
    (org_setup)
    )
  )


; doesn't seem to be working
; --------------------------
; plan9 style eshell
; http://www.masteringemacs.org/articles/2010/12/13/complete-guide-mastering-eshell/
(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

; use dpkg -L ledger-el to see where it is installed
(require 'ledger)
;; 2012-jun-18 - note: i couldn't find ledger.el in the system
;; 2012-jun-18 - so i copied it from github /usr/share/emacs/site-lisp/
(add-hook
 'ledger-mode-hook
 (lambda ()
   (local-set-key (kbd "C-c =") 'ledger-align-amounts)))

;temporarily commented out for better presentation
;; ; http://www.nongnu.org/color-theme/
;; (add-to-list 'load-path (concat emacs-root "emacs/color-theme-6.6.0"))
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-robin-hood)))

;https://raw.github.com/paradoxxxzero/jinja2-mode/master/jinja2-mode.el
(require 'jinja2-mode)

; O'Reilly - Writing GNU Emacs Extensions -- begin

(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)

(defun scroll-line-ahead (&optional n)
  "Scroll ahead n lines (defaul = 1)"
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n)))

(defun scroll-line-behind (&optional n)
  "Scroll behind n lines (defaul = 1)"
  (interactive "P")
  (scroll-behind (prefix-numeric-value n)))

(global-set-key "\C-x\C-q" 'quoted-insert)
(global-set-key "\C-q" 'scroll-line-behind)
(global-set-key "\C-z" 'scroll-line-ahead)

; O'Reilly - Writing GNU Emacs Extensions -- end

; erc - begin
; http://emacs-fu.blogspot.com/2009/06/erc-emacs-irc-client.html
(require 'erc)
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
  '((".*\\.freenode.net" "#startups" "#python-dev")))
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(defun erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?

    (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" 
           :port 6667 
           :nick "kirubakaran" 
           :full-name "kirubakaran athmanathan")
      )))

(global-set-key (kbd "C-c i") 'erc-start-or-switch)
; erc - end

; Ruby REPL
; https://github.com/nonsequitur/inf-ruby
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-keys))
(inf-ruby)
(setq ruby-indent-level 2)

; Mark Down
; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode
  "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

(setq org-capture-templates
      '(("j" "Journal" entry (file+datetree org-default-notes-file)
         "* %?\nEntered on %U\n  %i\n  %a")))

; coffeescript
; https://github.com/defunkt/coffee-mode
(require 'coffee-mode)
(setq whitespace-action
      '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style
      '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace

; word-count
(defun wc nil "Count words in buffer"
  (interactive)
  (save-excursion
    (save-restriction
      (save-match-data
        (shell-command-on-region (point-min) (point-max) "wc -w"))))
  nil)

(defun wcr (&optional b e)
  (interactive "r")
  (save-excursion
    (save-restriction
      (save-match-data
        (shell-command-on-region b e "wc -w"))))
  nil)

(defun wcst nil "Count words in subtree"
  (interactive)
  (save-excursion
    (save-restriction
      (save-match-data
        (org-narrow-to-subtree)
        (shell-command-on-region (point-min) (point-max) "wc -w"))))
  nil)

(defun start-day ()
  (interactive)
  (insert
   (concat "\n*** " (format-time-string "%b %d (%a)") "\n"
           "**** todo\n"
           "**** done\n"
           "**** freewriting\n"
           "     " (my-date-str) "\n"
           "     \n"
           "     "
           )))

(define-key global-map [f12] 'start-day)

; jrockway's eproject
(add-to-list 'load-path (concat emacs-root "emacs/eproject"))
(require 'eproject)
(require 'eproject-extras)
(define-project-type rails (generic)
  (or (look-for "Gemfile"))
  :relevant-files ("\.py$" "\.js$" "\.css$"))

; sass
;; (setq exec-path (cons (expand-file-name "~/.rvm/gems/ruby-1.9.3-p194/bin") exec-path))
;; (add-to-list 'load-path (expand-file-name "~/emacs/scss-mode"))
;; (autoload 'scss-mode "scss-mode")
;; (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
;;
;; need to do the equiv of
;; [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
;; for the above to work

(global-hi-lock-mode 1)

(defalias 'qrr 'query-replace-regexp)

; collapse org-mode buffer to first level titles
(fset 'collapse-to-title
      (lambda
        (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item
         (quote ([134217788 21 134217848 111 114 103 45 103 108
         111 tab return tab] 0 "%d")) arg)))

; Mar 08, 2013 - Wrote wrapper to keep it from triggering in other buffers
(defun collapse-to-title-wrap (&optional arg)
  (interactive "p")
  (if (string= (buffer-name) "timebuckets.org")
      (collapse-to-title)
    (insert "fl")
    ))

;;; --- begin : http://whattheemacsd.com/

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; full screen magit-status

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; easily move lines up and down

(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

;; opening lines
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<M-return>") 'open-line-below)
(global-set-key (kbd "<M-S-return>") 'open-line-above)

;; easier way of renaming current buffer file

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;;; --- end : http://whattheemacsd.com/

(custom-set-variables
 '(py-shell-switch-buffers-on-execute 1))

; --- begin journalhash ---
; post hash of journal.org to firebase
; view hashes at https://journalhash.firebaseio.com/hashes.json

(add-hook 'after-save-hook 'journal-hash-post)
(add-hook 'after-revert-hook 'journal-hash-post)

(defun journal-hash-post ()
  (interactive) ;make it available in buffers
  (if (string= (buffer-name) "journal.org")
      (progn
        (setq journal-hash (md5 (current-buffer)))
        (setq data (format "{ \"%s\": \"%s\|%s\" }"
                           (system-name)
                           journal-hash
                           (format-time-string "%b %d, %Y %H:%M")))
        (setq urlend "https://journalhash.firebaseIO.com/hashes.json")
        (setq cmd (format "curl -X PATCH -d '%s' %s" data urlend))
        (start-process-shell-command "journalhash" nil cmd)
        )
    )
  nil)

; --- end journalhash ---

; expand emacs package manager with community contributed packages
; http://sachachua.com/blog/2011/01/emacs-24-package-manager/
(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
