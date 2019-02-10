;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; csv
     ;; octave
     ;; autohotkey
     ;; windows-scripts
     ;; python
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil)
     better-defaults
     emacs-lisp
     git
     markdown
     ;; yaml
     ;; ruby
     org
     (shell :variables
            shell-default-shell 'shell
            shell-default-height 30
            shell-default-position 'bottom-and-right)
     ;; spell-checking
     syntax-checking
     ;; version-control
     csharp
     ;; lua
     ;; javascript
     ;; html
     ;; php
     (c-c++ :variables
            ;; c-c++-enable-clang-support t
            c-c++-default-mode-for-headers 'c++-mode)
     semantic
     ;; gtags
     ;; css
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t
                 evil-snipe-scope 'whole-buffer)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (os-specific-init)
  ;; Replace f/F/t/T behaviors with evil-snipe behavior
  (setq yas-installed-snippets-dir nil)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included
in the dump."
  )

(defun git-bash () (interactive)
       (let ((explicit-shell-file-name "c:/Program Files/Git/bin/bash.exe"))
         (call-interactively 'shell)))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (binding-config)
  (toggle-modes-config)
  (os-specific-config)
  (programming-config)
  (orx-config)
  (defun insert-current-date () (interactive)
         (forward-line)
         (insert (shell-command-to-string "echo -n $(date +'%Y/%m/%d ()')"))
         (forward-line))
  (defun insert-start-time () (interactive)
         (forward-char)
         (insert (shell-command-to-string "echo -n $(date +%H:%M)")))
  (defun insert-end-time () (interactive)
         (forward-char)
         (insert (shell-command-to-string "echo -n $(date +-%H:%M)")))
  ;; (add-to-list 'exec-path "/home/sseltzer/bin/ripgrep-0.10.0-x86_64-unknown-linux-musl/")
  ;; (spacemacs/set-leader-keys "ps" 'helm-projectile-rg)
  ;; (setq c-basic-offset 2
  ;;       tab-width 2
  ;;       c-tab-always-indent t
  ;;       c-syntactic-indentation-in-macros t
  ;;       indent-tabs-mode t)
  ;; (grep-apply-setting 'grep-template "rg --no-heading -H -uu -g <F> <R> <D>")
  )

(defun os-specific-init ()
  (message "Running OS-specific init for '%s'" system-type)
  (if (eq system-type 'windows-nt)
      (windows-init))
  )

(defun windows-config ()
  (message "Running Windows config")

  ;; I install aspell for windows and put it at this path
  ;; (add-to-list 'exec-path "C:/Aspell/bin/")
  ;; (setq ispell-program-name "aspell")
  ;; Start with spell-checking off by default to save load time
  ;; (spelling-checking)

  ;; I like using the shell that comes with Git when I'm on Wndows
  (setq shell-default-term-shell "C:/Program Files/Git/bin/bash.exe")
  ;; This is where Omnisharp lives on my Widnows machines
  (setq omnisharp-server-executable-path "~/omnisharp-win-x64/OmniSharp.exe")

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
;; TODO this does not yet support staging chunks of files, which makes it sorta useless at the moment since I often use that.
(define-derived-mode magit-staging-mode magit-status-mode "Magit staging"
  "Mode for showing staged and unstaged changes."
  :group 'magit-status)
(defun magit-staging-refresh-buffer ()
  (magit-insert-section (status)
    (magit-insert-untracked-files)
    (magit-insert-unstaged-changes)
    (magit-insert-staged-changes)
    ))
(defun magit-staging ()
  (interactive)
  (magit-mode-setup #'magit-staging-mode))
;; More tips: https://github.com/magit/magit/wiki/Tips-and-Tricks

(defun os-specific-config ()
  (message "Running OS-specific config for '%s'" system-type)
  (if (eq system-type 'windows-nt)
      (windows-config))
  )

;; Everything from here until the auto-generated stuff are helper functions that split up my user-init and user-config functions
;; It also contains some other stuff to bridge gaps between my Linux and Windows machines
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
  ;; Because I'm using alternate f/t behavior if I don't disable highlighting then
  ;; f<SPC> becomes very slow, for example
  (setq evil-snipe-enable-incremental-highlight nil)
  (setq evil-snipe-enable-highlight nil)
  )

(defun toggle-modes-config ()
  ;; Enable golden ratio by default
  (golden-ratio-mode)
  ;; TODO flyspell by default (have not yet found a way that works)
  ;; (spacemacs/toggle-spelling-checking-off)
  ;; Turn on indent guide
  (indent-guide-global-mode t)
  ;; Turn off syntax checking
  (spacemacs/toggle-syntax-checking-off)
  )

(defun fake-uc-mode ()
  (interactive)
  (spacemacs/toggle-syntax-checking-off)
  (c-mode)
  (spacemacs/toggle-syntax-checking-off)
  (setq indent-tabs-mode 't)
  (setq tab-width 4) ; Assuming you want your tabs to be four spaces wide
  (c-set-offset 'statement-block-intro '++)
  (c-set-offset 'defun-block-intro '++)
  (c-set-offset 'comment-intro 0)
  (c-set-offset 'statement-cont 0)
  (message "finished loading fake-uc-mode")
  )

(defun programming-config ()
  (defun my-semantic-hook ()
    (semantic-add-system-include "../inc" 'c++-mode))
  (add-hook 'semantic-init-hooks 'my-semantic-hook)

  ;; Use c-mode for unrealscript files
  (add-to-list 'auto-mode-alist '("\\.uc\\'" . fake-uc-mode))

  ;; misc
  ;; (setq-default js2-basic-offset 2)

  ;; Fix indents in C
  (setq c-default-style "linux"
        c-basic-offset 2)
  (setq-default c-auto-newline nil)

  ;; Fix indents in C#
  (defun my-csharp-hook ()
    (c-set-offset 'inline-open 0)
    (c-set-offset 'comment-intro 0)
    )
  (add-hook 'csharp-mode-hook 'my-csharp-hook)
  )

(defun windows-init ()
  ;; http://aspell.net/win32/
  ;; (add-to-list 'exec-path "C:/Aspell/bin/")
  ;; (setq ispell-program-name "aspell")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org tagedit stickyfunc-enhance srefactor spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv rake rainbow-delimiters pug-mode powershell popwin persp-mode pcre2el paradox spinner orgit org-plus-contrib org-bullets open-junk-file omnisharp shut-up neotree mwim multi-term move-text mmm-mode minitest markdown-toc markdown-mode magit-gitflow macrostep lua-mode lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gtags helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags fuzzy flycheck-pos-tip pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump f disaster diminish define-word csv-mode csharp-mode company-web web-completion-data company-tern s dash-functional tern dash company-statistics company-c-headers company column-enforce-mode coffee-mode cmake-mode clean-aindent-mode clang-format chruby bundler inf-ruby bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed ahk-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
