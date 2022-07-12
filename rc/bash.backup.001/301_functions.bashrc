

#!/usr/bin/env bash
############
# File:
# ~/.bash/30_functions.bashrc
#######
# functions: includes
[[ -f /opt/local/scripts/bashrc/310_functions_history.bashrc ]] 		&& . /opt/local/scripts/bashrc/310_functions_history.bashrc
[[ -f /opt/local/scripts/bashrc/320_functions_colors.bashrc ]] 		&& . /opt/local/scripts/bashrc/320_functions_colors.bashrc
#[[ -f ~/.bash/33_functions_extract.bashrc ]] 		&& . ~/.bash/33_functions_extract.bashrc
########
# functions: functions
_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}
# function:  Window Title
function window_title()
{
	case ${TERM} in
		xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
			PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
			;;
		screen*)
			PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
			;;
	esac
}



function lsexe()
{
	function lscompgen()
		{
			echo "################# ${1} #################"
			compgen "${2}${3}"
			echo "############################################"
		}
	case $1 in
		a*)
			lscompgen ALIASSES -a  
			;;
		b*) 
			lscompgen BUILDINS -b 
			;;
		c*)
			lscompgen COMMANDS -c 
			;;
		f*)
			lscompgen FUNCTIONS -A function 
			;;
		k*)
			lscompgen KEYWORDS -k  
			;;
		*|A*)	
			lsexe a
			lsexe b
			lsexe c
			lsexe f
			lsexe k
			echo "############# HELP #################"
			echo "use: $lsexe [a|b|c|f|k|A]"
		;;
	esac
}
function findexe()
{
	args=$(echo "$@" | xargs printf -- '.*?%s') 
	FOUND=$(compgen -A function -bcak | grep -Ei "$args.*?\$")
	echo $FOUND	
}

function fn_tequ() {
equery u $(tol $1)
}

function fn_temerge() {
emerge -a $(tol $1)
}


alias maked="micro /etc/portage/make.conf"
alias tequ="fn_tequ"
alias temerge="fn_temerge"


########
# functions: Executes
#
window_title
#
########
#############
#
# File:
# ~/.bash/300_functions.bashrc
#
##############
