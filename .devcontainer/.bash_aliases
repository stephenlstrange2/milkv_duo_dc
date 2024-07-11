export LC_ALL=C

alias sba="source /root/.bash_aliases"

source /home/work/duo-examples/envsetup.sh

# show git git branch in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]
\$(parse_git_branch)\[\e[00m\]$ "