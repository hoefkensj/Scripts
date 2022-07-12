#!/usr/bin/env bash
# ~/.bash/100_includes.bashrc
### Local
[[ -f /opt/local/scripts/bashrc/201_shopt.bashrc ]]                && . /opt/local/scripts/bashrc/201_shopt.bashrc
[[ -f /opt/local/scripts/bashrc/301_functions.bashrc ]]            && . /opt/local/scripts/bashrc/301_functions.bashrc
[[ -f /opt/local/scripts/bashrc/401_variables.bashrc ]]            && . /opt/local/scripts/bashrc/401_variables.bashrc
[[ -f /opt/local/scripts/bashrc/501_aliases.bashrc ]]              && . /opt/local/scripts/bashrc/501_aliases.bashrc
[[ -f /opt/local/scripts/bashrc/601__exports.bashrc ]]              && . /opt/local/scripts/bashrc/601__exports.bashrc

#for bashrc in /opt/local/scripts/bashrc/*01* ; do
#	[[ -r ${bashrc} ]] && source "${bashrc}"
#done
#[[ -f /opt/local/scripts/bashrc/310_functions_history.bashrc ]]    && . /opt/local/scripts/bashrc/310_functions_history.bashrc
#[[ -f /opt/local/scripts/bashrc/320_functions_colors.bashrc ]]     && . /opt/local/scripts/bashrc/320_functions_colors.bashrc
#[[ -f ~/.bash/510_aliases_arco.bashrc ]]         && . ~/.bash/510_aliases_arco.bashrc
###  System
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
# ~/.bash/100_includes.bashrc
###
