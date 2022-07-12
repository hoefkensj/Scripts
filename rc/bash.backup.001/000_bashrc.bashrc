#
# 000_bashrc.bashrc
#
#
########
# Dont do anything if not interactivel:
[[ $- != *i* ]] && return
########
# includes
[[ -f /etc/profile ]] && . /etc/profile
[[ -f /opt/local/scripts/bashrc/100_includes.bashrc ]] && . /opt/local/scripts/bashrc/100_includes.bashrc
########
xhost + > /dev/null 2>&1
########

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind 'set completion-ignore-case on'

# Save each command to the history file as it's executed.  #517342
# This does mean sessions get interleaved when reading later on, but this
# way the history is always up to date.  History is not synced across live
# sessions though; that is what `history -n` does.
# Disabled by default due to concerns related to system recovery when $HOME
# is under duress, or lives somewhere flaky (like NFS).  Constantly syncing
# the history will halt the shell prompt until it's finished.
PROMPT_COMMAND='history -a'

for sh in /etc/bash/bashrc.d/* ; do
	[[ -r ${sh} ]] && source "${sh}"
done
# Try to keep environment pollution down, EPA loves us.
unset use_color sh
### Bashhub.com Installation.
### This Should be at the EOF. https://bashhub.com/docs
[[ -f ~/.bashhub/bashhub.sh ]]	&&	.  ~/.bashhub/bashhub.sh
################################################################################
