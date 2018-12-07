##### User Aliases Akagi ver. 1.3 #####

# This is a set of bash aliases adapted for server akagi, my home media
# server

### general aliases
alias spdtst='speedtest-cli --server 7167 --share'
alias df='pydf'
alias sx='startx'
alias i3conf='nano ~/.config/i3/config'

# cd aliases
alias cd.='cd ..'
alias cd~='cd ~'
alias cdx='cd /media/exhdd'
alias cdtmp='cd /tmp'
alias cdtrns='cd ~/transmission'
alias cdbkup='cd ~/recording-backup'
alias cddot='cd ~/.dotfiles'
### exhdd aliases
alias drives='sudo fdisk -l'
alias mnta='sudo mount /dev/sda2 /media/exhdd'
alias mntb='sudo mount /dev/sdb2 /media/exhdd'
alias mntc='sudo mount /dev/sdc2 /media/exhdd'
alias umnt='sudo umount /media/exhdd'

### apt aliases
alias updt='sudo apt update && sudo apt upgrade'
alias inst='sudo apt install'
alias addrepo='sudo apt-add-repository'
alias prge='sudo apt purge'
alias remo='sudo apt remove'
alias aremo='sudo apt autoremove'
alias distup='sudo apt update && sudo apt upgrade && sudo apt dist-upgrade'

### Changelog
# ver. 1.3:  "general aliases"
#              added cddot to cd aliases
#
# ver. 1.2:  "general aliases"
#              added cd aliases (cd., cd~, cdtmp, cdx, cdtrns, cdbkup)
#              added df alias
#              simplified 'speedtest' to 'spdtst'
#              added sx alias
#              added i3conf alias
#
# ver. 1.1:  added Changelog
#            added "general aliases" section
#            "general aliases"
#              removed alias 'akagi'
#            "apt aliases"
#              simplified 'update' and 'purge' to 'updt' and 'prge'
