# vscode-setup
Some small scripts and configurations I use to develop python code using VSCode

## Ansible setup
Running `sudo ansible-playbook root_install.yaml` will:
* install git, python3-pip, virtualenvwrapper, ipython
* install zsh, fzf
* install vscodium
* install Sourcetrail
* download (not install) Fura Mono Nerd Font and Fira Code

Running `ansible-playbook user_install.yaml` setting will:
* Install all the vscodium plugins that I use (see list below)
* create color and debug IPython profiles
* Install zsh-autosuggestions and zsh-syntax-highlighting
* Install zsh powerlevel10k theme

# mkvscode_full-activate
* This script
* At the top of the script, ``` venvs=`echo $HOME/.virtualenvs/*/` ``` defines where to look for virtual environments, which by default is the [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) `WORKON_HOME` variable. If you want to change your virtual enviroment location, you have to change this path. However, the script assumes your virtual environment are all located under a common top directory:

```
/foo/bar/myproject/bin/activate
/foo/bar/http_requester/bin/activate
/foo/bar/scrapy/bin/activate
...
```
in this case, ``` venvs=`echo /foo/bar/*/` ```

# Useful vscode extensions
## Git
* [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
* [Git Merger](https://marketplace.visualstudio.com/items?itemName=shaharkazaz.git-merger)
* [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)
* [Git History](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)
* [Git History Diff](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)

## Markdown
* [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
* [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)

## Python
* [Microsoft Python extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
* [autoDocstring](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)

## Other languages
* [Microsoft Ansible extension](https://marketplace.visualstudio.com/items?itemName=vscoss.vscode-ansible)
* [Microsoft Docker extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
* [Microsft yaml extension](https://marketplace.visualstudio.com/items?itemName=docsmsft.docs-yaml)
* [Kubernetes ipedrazas extension](https://marketplace.visualstudio.com/items?itemName=ipedrazas.kubernetes-snippets)

## Format/color
* [TabSanity](https://marketplace.visualstudio.com/items?itemName=jedmao.tabsanity) Navigate or modify soft tabs as if they were hard tabs (e.g. if tab=4spaces you can only move 4spaces back/fwd)
* [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)
* [Monokai Vibrant](https://marketplace.visualstudio.com/items?itemName=s3gf4ult.monokai-vibrant)
* [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight)

## Misc
* [Shell launcher](https://marketplace.visualstudio.com/items?itemName=Tyriar.shell-launcher)
* [macros](https://marketplace.visualstudio.com/items?itemName=geddski.macros)
* [sourcetrail](https://marketplace.visualstudio.com/items?itemName=astallinger.sourcetrail)
* [vscode icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)

# Keyboard shortcuts
* `ctrl+shift+F5` -> Revert (Reload) File
* `alt+Z` -> Toggle word wrapping
## Integrated terminal
* `ctrl+shift+T` -> Open a new terminal (shell launcher)
* `ctrl+alt+J` -> Toggle terminal
* ```ctrl+` ``` -> Toggle between terminal and editor focus
* `ctrl+k ctrl+shift+n` -> Switch to next terminal
* `ctrl+k ctrl+shift+p` -> Switch to previous terminal
* `ctrl+shift+N` -> Switch to Nth terminal (N=1-9)
## IPython
* `F5` -> Write run 'path/to/script.py' into the terminal (assumes it's an IPython terminal)
* `F9` -> Copy-paste selection into terminal
* `Ctrl+J, Ctrl+Q` -> Create a new line in IPython without executing
* `Esc, Enter` -> Execute current IPython cell now without having to scroll to the bottom
* `Ctrl+Q` -> Extract caller's enviroment to the IPython shell. **Note that this it overwrites
  the predefined shortcut for exiting VSCode**
* [Customize text color](https://stackoverflow.com/questions/14129278/how-do-i-customize-text-color-in-ipython)
* Move ipython_config.py to `~/.ipython/profile_default/ipython_config.py` (only newer IPython versions have syntax highlighting)
## tmux
* `Ctrl+B` -> `Ctrl+Shift+B` Reassigns `workbench.action.toggleSidebarVisibility` to use `tmux` shortcuts
* `Ctrl+K, U` -> **Keep unsaved** and close saved files only
* `Ctrl+K, W` -> **Whack** and close (discard unsaved files)

## vscode tricks
* `Ctrl+K, Enter` -> **Keep** current file from closing (*italics* means it's opened in preview mode and 
opening a new file will replace it)
* `F12` -> Go to Definition 
* `Ctrl+F12` -> Go to Implementation
* `Shift+F12` -> Go to References

### refactoring
* `F2` -> Rename symbol consistently with language syntax
* `Right click`
  * Extract method
  * Extract variable

[vscode cheatsheet](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)
## Common shortcuts
* `Ctrl+F` -> Search
* `Ctrl+H` -> Search and replace
  * `Enter` -> Single replace
  * `Ctrl+Alt+Enter` -> Replace all
  * `Alt+R` -> Toggle Regex
* `Alt+Ctrl+-` -> Back
* `Ctrl+Shift+-` -> Forward

## Snippets
* `Ctrl+B, Ctrl+Q` -> Extract caller's enviroment to the IPython shell.
* `Ctrl+B, Ctrl+E` -> `from IPython import embed; embed()`
* `Ctrl+B, Ctrl+B` -> Set Breakpoint with IPython `embed()`
* `Ctrl+Shift+R` -> Rerun: **Re**load all modules an **run** on IPython `%load_ext autoreload %autoreload run`

# Fonts
* I use [Fira Code](https://github.com/tonsky/FiraCode), a monospaced font with programming ligatures.

# Command Menu
* Open with `Ctrl+Shift+P`
* `Terminal: Rename` to rename current integrated terminal

# Tricks
## pylint
*  To select the proper pylint path for your project, set .vscode/settings.json -> `"python.linting.pylintPath": "cd /home/user/full/path/to/code && pylint"`
