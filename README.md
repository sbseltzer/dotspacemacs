# .spacemacs.d

Installation:

Start by closing Spacemacs.

Make a backup of your `.spacemacs` file if you have one.

Clone this configuration.
```
git clone --recursive https://github.com/seltzy/dotspacemacs.git ~/.spacemacs.d
```
Comment out the line at the top of `init.el` that requires hyde ( `(require 'hyde)` ) and start emacs. Uncomment the line and reload the config with `SPC f e R`.

The previous step is probably the wrong way of doing things, but it was the only way way I found to make sure hyde and jekyll layers configure properly.

Note for Windows configuration: When setting up a shortcut, have it as follows:
```
"path/to/bash.exe" -l -c runemacs.exe
path/to/home
```
