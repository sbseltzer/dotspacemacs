(defun windows-config ()
  (message "Running Windows config")
  ;; I like using the shell that comes with Git when I'm on Wndows
  (setq shell-default-term-shell "C:/Program Files/Git/bin/bash.exe")
  ;; This is where Omnisharp lives on my Widnows machines
  (setq omnisharp-server-executable-path "~/personal/omnisharp-win-x64/OmniSharp.exe")

  ;; Try to improve slow performance on windows.
  (setq w32-get-true-file-attributes nil)

  ;; Try to fix tramp on windows.
  ;; (setq tramp-default-user "sam")
  ;; (setq tramp-default-method "scp")
  ;; (setq tramp-verbose 6)
  ;; (setq tramp-ssh-controlmaster-options
  ;;       "-tt -o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=yes")
  ;; (add-to-list 'tramp-remote-path  "/usr/local/git/bin")
  ;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  )

;; Fix on windows to improve magit status performance
;; https://emacs.stackexchange.com/questions/19440/magit-extremely-slow-in-windows-how-do-i-optimize#19525
;; WORKAROUND https://github.com/magit/magit/issues/2395
(define-derived-mode magit-staging-mode magit-status-mode "Magit staging"
  "Mode for showing staged and unstaged changes."
  :group 'magit-status)
(defun magit-staging-refresh-buffer ()
  (magit-insert-section (status)
                        (magit-insert-untracked-files)
                        (magit-insert-unstaged-changes)
                        (magit-insert-staged-changes)))
(defun magit-staging ()
  (interactive)
  (magit-mode-setup #'magit-staging-mode))
;; More tips: https://github.com/magit/magit/wiki/Tips-and-Tricks

(provide 'extra/windows)
