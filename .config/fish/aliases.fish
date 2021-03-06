# Fast reset
alias w="tput reset"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
abbr -a -- - 'cd -'

# fasd aliases
alias v='f -e vim' # quick opening files with vim
alias m='f -e vlc' # quick opening files with vlc
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias o='a -e xdg-open' # quick opening files with xdg-open

# Shortcuts
alias b="cd ~/dropbox"
alias dl="cd ~/dl"
alias u="cd ~/ulb"
alias h="history"
alias t="touch"
alias r="ranger"
alias q="exit"
alias lvl="echo $SHLVL"
abbr wi wifi
abbr ws wifi.endpoints.scan
alias tk="task rc:~/.config/task/.taskrc"
abbr srv server
abbr rfc ref.rename.from.contents
abbr k "pkill -9"

# Git
abbr g git

# Vim
abbr e vim

# Alias all git aliases
for al in (git la)
    abbr g$al "git $al"
end

alias up="update"
alias ss="services.show"


# errors from journal
alias errors="journalctl -b -p err|less"

# List all files colorized in long format
alias l="exa -l"

# List all files colorized in long format, including dot files
alias la="exa -al"

# List only directories
alias lsd="exa -l | grep --color=never '^d'"

# Use exa instead of ls
alias ls="exa"
# Colors for `ls`
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Echo full path of file
alias path="readlink -f"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Use Git's colored diff when available
command -v git > /dev/null; and alias diff="git diff --no-index --color-words"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D."; and date; and time cat; and date'

# View HTTP traffic
alias sniff="sudo ngrep -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null; or alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null; or alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null; or alias sha1sum="shasum"

# URL-encode strings
#alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS
	alias "$method"="lwp-request -m '$method'"
end

# Make Grunt print stack traces by default
command -v grunt > /dev/null; and alias grunt="grunt --stack"

# Lock the screen (when going AFK)
alias afk="system.LS"

# youtube-dl
alias vdl='youtube-dl'
alias adl='youtube-dl -f140 --'

# thefuck aliases
# THIS IS WAY TOO SLOW
# eval $(thefuck --alias fu)
function fu --description 'Run previous console command with sudo'
  commandline "sudo $history[1]"
end
function fuu -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_ALIAS=fuu PYTHONIOENCODING=utf-8 thefuck $fucked_up_command | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    history --delete $fucked_up_command
    history --merge ^ /dev/null
  end
end
alias fuuu=fuu
alias fuuuu=fuu
alias fuk=fuu
alias fuuk=fuu
alias fuuuk=fuu
alias fuc=fuu
alias fuuc=fuu
alias fuuuc=fuu
alias fuck=fuu
alias fuuck=fuu
alias fuuuck=fuu

# typos
abbr udpate update
abbr maek make

# systemctl
abbr S systemctl
abbr U systemctl --user

# search
abbr ff fzf
abbr agh ag --hidden
