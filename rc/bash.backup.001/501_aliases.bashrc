#!/bin/bash
#
# File:
# ~/.bash/aliasses_ARCO.bashrc
##

alias rebash='source ~/.bash_profile'

alias ll='ls -bghAls'
alias llr='ls -bRghAls'
alias rmr="rm -r"
alias rmrf="sudo rm -rf"

alias frqmax='cpupower frequency-set -g performance'
alias frqmin='cpupower frequency-set -g powersave'
alias frqinf='cpupower frequency-info'

#alias cp="cp -iv"                          # confirm before overwriting something
alias df='df -h'                          		# human-readable sizes
alias free='free -m'                      		# show sizes in MB
alias du='du -hc'
alias du-s='du -hcs'

alias b-du='btrfs file du --human-readable -s'
alias b-s='btrfs subv'     						#= btrfs subvolume $
alias ls-bs='btrfs subv list' 					#= btrfs subvolume list $
alias dd-bs='btrfs subv snapshot' 				#= btrfs subvolume duplicate  $
alias mk-bs='btrfs subv create' 				#= btrfs subvolume create $
alias rm-bs='btrfs subv delete' 				#= btrfs subvolume delete $

alias b-f='sudo btrfs file'    #= btrfs filesystem $

#systemctl
alias sctl="systemctl"
#ps
alias psa="ps auxf"
alias ppsgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

alias ntfixall="lsblk -o FSTYPE,PATH  | awk '$1 == \"ntfs\" {print $2}'"



# alias pycharm="/opt/JetBrains/apps/PyCharm-C/ch-0/203.7717.81/bin/pycharm.sh &"
alias ccat='ccat --bg="dark" -G Decimal="*green*" -G Keyword="blue" -G Punctuation="*yellow*" -G Plaintext="reset" -G String="brown" -G Type="*white*" -G Literal="fuchsia"'
alias cat="bat"
alias equ="equery"
alias equu="equery u"
alias usee="euse -E"
alias usep="euse -p $_ -E"
alias esel="eselect"
alias repsel="eselect repository enable"
alias repdel="eselect repository disable"
alias emsync="emaint sync"
#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias ytv-best="youtube-dl -f bestvideo+bestaudio "
