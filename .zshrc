# Zsh Configuration

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Oh-My-Zsh Theme
ZSH_THEME="spaceship"

# Oh-My-Zsh Options
# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins
plugins=(git vscode)

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# User Configuration

## Environment Variables
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/home/felipe/github.com/felipefbs/scripts"
export EDITOR='nvim'

## Alias

### Apt Alias
alias at="sudo apt update"
alias att="sudo apt update && sudo apt upgrade -y"
alias autoremove="sudo apt autoremove"
alias autoclean="sudo apt autoclean"
alias install="at && sudo apt install -y"

### Git Alias
alias gs="git status --short"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gap="git add --patch"
alias gc="git commit"
alias gp="git push"
alias gu="git pull --rebase"
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(auto) %D%n%s%n'"
alias gb="git branch"
alias gi="git init"
alias gcl="git clone"

## Spaceship Prompt Configuration
SPACESHIP_USER_SHOW=always
SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_PROMPT_ORDER=(
  time          # Time section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  golang        # Golang section
  node          # Node.js section
  docker        # Docker section
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL=">"
SPACESHIP_CHAR_SUFFIX=" "

# Zinit Configuration

## Zinit Installation
ZINIT="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT ] && mkdir -p "$(dirname $ZINIT)"
[ ! -d $ZINIT/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT"
source "${ZINIT}/zinit.zsh"

## Zinit Autoload and Completions
autoload -U compinit && compinit
zinit cdreplay -q

## Zinit Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light spaceship-prompt/spaceship-prompt
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh