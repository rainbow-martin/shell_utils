# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

alias ll='ls -hl'
alias gti=git
alias ggrpe=ggrep
alias gitdiff='git difftool'

function ggrep
{
	grepOptions="-nr"
	grepKeywords=""
	if [ $# -gt 1 ]; then
    	if [[ $1 =~ -.* ]]; then
    	    grepOptions=$grepOptions${1#*-}
    	fi
		grepKeywords=$2
	else
		grepKeywords=$1
	fi

	echo "grep option: "$grepOptions", grep keyword: $grepKeywords"
	grep $grepOptions "\<$grepKeywords\>" * --color
}

function findn
{
	find . -name "$1"
}

function gitci
{
	git st | grep modified | awk '{print "git add "$2}' | sh
}

function gitdel
{
	git st | grep deleted | awk '{print "git add "$2}' | sh
}

function ckgitlog
{
	for filepath in $(find . -name "$1")  
	do
	    echo "Check git log for file: "+$filepath
		git log --pretty=oneline $filepath
	done
}

function up
{
	for ((i=1; i<=$1; i ++))
	do
	    cd ..
	done
}
