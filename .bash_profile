#############
# FUNCTIONS #
#############
workon (){
    virtual_env_name=$1
    source ~/.virtualenvs/$virtual_env_name/bin/activate
    if [[ "$virtual_env_name" =~ "_" ]]; then
        virtual_env_name=$(echo $1 | cut -d "_" -f 1)
    fi
    if [ -d ~/Projects/$virtual_env_name ]; then
        cd ~/Projects/$virtual_env_name
    fi
}

runmysql(){
    MYSQL_DATA_DIR=ramdisk
    mysql.server stop || true
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://1165430`
    mysql_install_db --datadir=/Volumes/ramdisk --basedir=`brew --prefix mysql`
    mysql.server start --datadir=/Volumes/ramdisk
}

#########
# ALIAS #
#########
alias l='ls -lha'
alias "cd.."="cd .."
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

#######
# RVM #
#######
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export CLICOLOR=1
export LSCOLORS=gxfxcxdxBxxxxxxxxxxxxx

# Colors from http://wiki.archlinux.org/index.php/Color_Bash_Prompt
NO_COLOR='\e[0m' #disable any colors
# regular colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\e[0;37m'
# emphasized (bolded) colors
EBLACK='\033[1;30m'
ERED='\033[1;31m'
EGREEN='\033[1;32m'
EYELLOW='\033[1;33m'
EBLUE='\033[1;34m'
EMAGENTA='\033[1;35m'
ECYAN='\033[1;36m'
EWHITE='\033[1;37m'
# underlined colors
UBLACK='\033[4;30m'
URED='\033[4;31m'
UGREEN='\033[4;32m'
UYELLOW='\033[4;33m'
UBLUE='\033[4;34m'
UMAGENTA='\033[4;35m'
UCYAN='\033[4;36m'
UWHITE='\033[4;37m'
# background colors
BBLACK='\033[40m'
BRED='\033[41m'
BGREEN='\033[42m'
BYELLOW='\033[43m'
BBLUE='\033[44m'
BMAGENTA='\033[45m'
BCYAN='\033[46m'
BWHITE='\033[47m'

#######
# PS1 #
#######
parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

function parse_git_color
{
  if [ "$(parse_git_dirty)" == "*" ] ; then
    echo "0;31m"
  else
    echo "0;32m"
  fi
}

PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\] \[$YELLOW\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[\033[\$(parse_git_color)\]\$(parse_git_branch)\[$EWHITE\]\nϟ\[$EWHITE\] \[$RESET\]"


