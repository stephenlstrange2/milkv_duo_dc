
alias sba="source .bash_aliases"

# sudo dmesg | grep usb0
# returns something like: [12075.843694] rndis_host 1-2.2:1.0 enx4a2f1e666665: renamed from usb0

# ip addr show enx4a2f1e666665
# returns something like:     inet 192.168.42.209/24 brd 192.168.42.255 scope global dynamic noprefixroute enx4a2f1e666665

# ping 192.168.42.1  to check
# ssh in at root@192.168.42.1 password:milkv


source ~/envsetup.sh

# show git git branch in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]
\$(parse_git_branch)\[\e[00m\]$ "