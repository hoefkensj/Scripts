#!/usr/bin/env bash
#
# File:
# ~/.bash/31_functions_history.bashrc
##
HISTSIZE=9999999999999						#infinit
HISTFILESIZE=$HISTSIZE						# !!
#HISTCONTROL=ignorespace					# dont incl $_[space]_command
HISTLOGDIR="${HOME}/.bash/log"
[[ -d $HISTLOGDIR ]] || mkdir -p $HISTLOGDIR  #create logddir if it doesnt exist
HISTALLFILE="${HOME}/.bash/log/histall.log"


function _bash_history_sync() {
    builtin history -a $HISTFILE      
    builtin history -a $HISTALLFILE       
    HISTFILESIZE=$HISTSIZE    
    builtin history -c         
    builtin history -r         
}

function history() {          
    _bash_history_sync
    builtin history "$@"
}

function append_histall() {
	builtin history -a $HISTALLFILE
	
}

function histall() {          
    ccat $HISTALLFILE    
}
#_bash_history_sync

# Synchronize history between bash sessions
#
# Make history from other terminals available to the current one. However,
# don't mix all histories together - make sure that *all* commands from the
# current session are on top of its history, so that pressing up arrow will
# give you most recent command from this session, not from any session.
#
# Since history is saved on each prompt, this additionally protects it from
# terminal crashes.


# keep unlimited shell history because it's very useful
export HISTFILESIZE=-1
export HISTSIZE=-1
shopt -s histappend   # don't overwrite history file after each session


# on every prompt, save new history to dedicated file and recreate full history
# by reading all files, always keeping history from current session on top.
update_history () {
  history -a ${HISTFILE}.$$
  history -c
  history -r  # load common history file
  # load histories of other sessions
  for f in `ls ${HISTFILE}.[0-9]* 2>/dev/null | grep -v "${HISTFILE}.$$\$"`; do
    history -r $f
  done
  history -r "${HISTFILE}.$$"  # load current session history
}
if [[ "$PROMPT_COMMAND" != *update_history* ]]; then
  export PROMPT_COMMAND="update_history; $PROMPT_COMMAND"
fi

# merge session history into main history file on bash exit
merge_session_history () {
  if [ -e ${HISTFILE}.$$ ]; then
    cat ${HISTFILE}.$$ >> $HISTFILE
    \rm ${HISTFILE}.$$
  fi
}
trap merge_session_history EXIT


# detect leftover files from crashed sessions and merge them back
active_shells=$(pgrep `ps -p $$ -o comm=`)
grep_pattern=`for pid in $active_shells; do echo -n "-e \.${pid}\$ "; done`
orphaned_files=`ls $HISTFILE.[0-9]* 2>/dev/null | grep -v $grep_pattern`

if [ -n "$orphaned_files" ]; then
  echo Merging orphaned history files:
  for f in $orphaned_files; do
    echo "  `basename $f`"
    cat $f >> $HISTFILE
    \rm $f
  done
  echo "done."
fi

