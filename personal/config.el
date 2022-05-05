;; packages
;;

(prelude-require-packages '(blacken vagrant-tramp))
(require 'blacken)

;; Vagrant
;;
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; WSL2
;;

(defun copy-selected-text (start end)
    (interactive "r")
    (if (use-region-p)
        (let ((text (buffer-substring-no-properties start end)))
            (shell-command (concat "echo '" text "' | clip.exe")))))


;; Always recentre when leaving Swiper
;;

(setq swiper-action-recenter t)

;; diff-hl
;;

(global-diff-hl-mode)

;; hl-line
;;

(global-hl-line-mode 1)

(set-face-background 'hl-line "#e5e5e5")
(set-face-foreground 'highlight nil)

;; avy
;;

(global-set-key (kbd "M-g j") 'avy-goto-char-timer)

;; blacken
;;


(setq blacken-line-length 88)

(add-hook 'python-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'blacken-buffer)))

;; whitespace
;;

(setq whitespace-line-column 88)

;; https://stackoverflow.com/questions/61684949/time-formatting-for-org-clocktable-report
(setq org-duration-format 'h:mm)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "|" "CANCELLED(c@/!)" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "orange" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              (done ("WAITING"))
              ("TODO" ("WAITING") ("CANCELLED"))
              ("NEXT" ("WAITING") ("CANCELLED"))
                 ("DONE" ("WAITING") ("CANCELLED")))))

;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)
(setq org-time-stamp-rounding-minutes (quote (1 1)))
(setq org-agenda-clock-consistency-checks
      (quote (:max-duration "4:00"
                            :min-duration 0
                            :max-gap 0
                            :gap-ok-around ("4:00"))))


;; http://orgmode.org/worg/org-contrib/babel/examples/fontify-src-code-blocks.html
;; fontify code in code blocks
(setq org-src-fontify-natively t)
