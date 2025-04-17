fish_add_path ~/.dotfiles/bin
fish_add_path ~/bin
fish_add_path ~/.local/bin

# no greeting
set fish_greeting ""

# git alias
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.cm commit
git config --global alias.st status
git config --global alias.ad add
git config --global alias.br branch
git config --global alias.subup "submodule update --init --recursive"
git config --global alias.subst "submodule status --recursive"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# no space after abbreviations
# bind " " expand-abbr or self-insert

# git abbreviations
abbr -a g 'git'
abbr -a ga 'git add'
abbr -a gp 'git push'
abbr -a gpa 'git push --all'
abbr -a gu 'git pull'
abbr -a gf 'git fetch'
abbr -a gs 'git status'
abbr -a gd 'git diff'
abbr -a gt 'git stash'
abbr -a gta 'git stash apply'
abbr -a gdc 'git diff --cached'
abbr -a gm 'git commit -m'
abbr -a gma 'git commit -am'
abbr -a gb 'git branch'
abbr -a gba 'git branch -a'
abbr -a gc 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a grv 'git remote -v'
abbr -a gcd 'git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'
abbr -a gl 'git log'
abbr -a glg 'git lg'
abbr -a glol 'git lol'
abbr -a glola 'git lola'
abbr -a gua "find . -maxdepth 3 -type d -name .git | xargs dirname |xargs -P 40 -n 1 -I '{}' sh -c 'cd {}; echo {}; git pull'"
abbr -a gsa "find . -maxdepth 3 -type d -name .git | xargs dirname |xargs -n 1 -I '{}' sh -c 'cd {}; echo {}; git status'"

# Current branch or SHA if detached.
alias gbs='git branch | perl -ne '"'"'/^\* (?:\(detached from (.*)\)|(.*))/ && print "$1$2"'"'"''

# vim related stuff
alias vi="nvim -p"
alias vim="nvim -p"
set -x EDITOR nvim -p
set -x VISUAL_EDITOR nvim -p

# helix
alias hx="helix"

# docker stuff
set -x DOCKER_ID_USER "nordewal"
abbr -a dc 'docker-compose '
abbr -a dce 'docker-compose exec '
abbr -a dklc 'docker ps -l'  # List last Docker container
abbr -a dklcid 'docker ps -l -q'  # List last Docker container ID
abbr -a dklcip 'docker inspect -f "{{.NetworkSettings.IPAddress}}" $(docker ps -l -q)'  # Get IP of last Docker container
abbr -a dkps 'docker ps'  # List running Docker containers
abbr -a dkpsa 'docker ps -a'  # List all Docker containers
abbr -a dki 'docker images'  # List Docker images
abbr -a dkrmac 'docker rm (docker ps -a -q)'  # Delete all Docker containers
abbr -a dkrmdi 'docker images -q -f dangling=true |xargs -r docker rmi'  # Delete all dangling Docker images
abbr -a dkelc 'docker exec -it (dklcid) bash' # Enter last container (works with Docker 1.3 and above)

# misc aliases
alias ssh="env TERM=xterm ssh"
alias fd="fdfind"
alias la="ls -lsha --color $argv"
alias ll="ls -lsh --color $argv"
alias bat="batcat"

# misc abbr
abbr -a vimdiff 'nvim -d'

# disable fzf Ctrl-R
fzf_key_bindings
bind --erase \cr

# set locales
if status -l; and test -r /etc/locale.conf
    for kv in (grep -Ev '^\s*($|#.*)' /etc/locale.conf)
        set -gx (string split "=" -- $kv)
    end
end

# start ssh-agent if not running
if test -z (pgrep ssh-agent)
  eval (ssh-agent -c) > /dev/null
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

# include custom dotfiles
if test -e ~/.config/fish/config_local.fish
  source ~/.config/fish/config_local.fish
end
if test -e ~/.dotfiles_custom/config/fish/config.fish
  source ~/.dotfiles_custom/config/fish/config.fish
end
if test -e ~/.dotfiles_custom/config/fish/completions
  set -gx fish_complete_path $fish_complete_path ~/.dotfiles_custom/config/fish/completions
end
