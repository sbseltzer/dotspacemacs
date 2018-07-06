;;; user-config-helpers.el
;; I split my user config into a bunch of code snippets in a separate file.
;; I did this as an attempt to make organizing things easier, and make merges simpler.

(defmacro define-and-bind-text-object (key start-regex end-regex)
  "Helper function for adding inner-/outer- regex bindings in evil-mode."
  (let ((inner-name (make-symbol "inner-name"))
        (outer-name (make-symbol "outer-name")))
    `(progn
       (evil-define-text-object ,inner-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count nil))
       (evil-define-text-object ,outer-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count t))
       (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
       (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

(when (eq system-type 'windows-nt)
  (require 'extra/windows))

(defun os-specific-config ()
  (message "Running OS-specific config for '%s'" system-type)
  (if (eq system-type 'windows-nt)
      (windows-config))
  )

(defun os-specific-layers ()
  (message "Running OS-specific config for '%s'" system-type)
  (if (eq system-type 'windows-nt)
      (windows-config))
  )

(defun orx-config ()
  "Configuration to help with Orx development."
  ;; TODO make this unique to orx ini files
  ;; Add some wrappers
  (define-and-bind-text-object ":" "[:|]" "[:|]")
  )

(defun binding-config ()
  ;; Allow me to do fd or df for escape sequence.
  (setq evil-escape-unordered-key-sequence t)

  ;; I bind redo to U to be more analogous to u (in my mind)
  (define-key evil-normal-state-map "U" (lambda()
                                          (interactive)
                                          (undo-tree-redo)
                                          ))

  ;; Rebind surround to S instead of s, so we can use s for avy
  (evil-define-key 'operator evil-surround-mode-map "S" 'evil-surround-edit)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

  ;; avy setup
  (evil-define-key '(normal motion) global-map "s" 'evil-avy-goto-char-2)
  (evil-define-key '(normal motion) evil-surround-mode-map "s" 'evil-avy-goto-char-2) ;;'evil-avy-goto-word-or-subword-1 is also nice
  (evil-define-key '(visual motion) evil-surround-mode-map "s" 'evil-avy-goto-char-2) ;;'evil-avy-goto-word-or-subword-1 is also nice
  (evil-define-key '(normal motion visual operator) global-map (kbd ";") 'avy-goto-line)
  (setq avy-all-windows nil)

  ;; snipe setup
  ;; Replace f/F/t/T behaviors with evil-snipe behavior
  (setq evil-snipe-enable-alternate-f-and-t-behaviors t)
  ;; Because I'm using alternate f/t behavior if I don't disable highlighting then
  ;; f<SPC> becomes very slow, for example
  (setq evil-snipe-enable-incremental-highlight nil)
  (setq evil-snipe-enable-highlight nil)
  )

(defun toggle-modes-config ()
  ;; Enable golden ratio by default
  (golden-ratio-mode)
  ;; Turn off flyspell by default
  (flyspell-mode-off)
  (spacemacs/toggle-spelling-checking-off)
  ;; Turn on indent guide
  (indent-guide-global-mode t)
  ;; Turn off syntax checking
  (spacemacs/toggle-syntax-checking-off)
  )

(defun programming-config ()
  (defun my-semantic-hook ()
    (semantic-add-system-include "../inc" 'c++-mode))
  (add-hook 'semantic-init-hooks 'my-semantic-hook)

  ;; misc
  ;; (setq-default js2-basic-offset 2)

  ;; Fix indents in C
  (setq c-default-style "linux"
        c-basic-offset 2)
  (setq-default c-auto-newline nil)
  )

(provide 'user-config-helpers)
