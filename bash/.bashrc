#source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export EDITOR=vim
# for prompt, only show username if it isn't me or a different host
if [[ $(hostname -f) == "CMMC02Z22K8LVCH" && $(id -u) == 85708632 ]];then
		# you are you and here, don't state the obvious
		# PS1="\[$txtred\]\[$(ruby -v | cut -d" " -f2)\]\[$txtrst\] \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
		PS1="\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
else
		#show username and hostname
		#PS1="\[$txtred\]\[$(ruby -v | cut -d" " -f2)\]\[$txtrst\] \u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
		PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
fi


# Automatically register identity to ssh agent
ssh-add -L &> /dev/null
if [ $? -eq 1 ]; then
	ssh-add
fi

# Add in some friendly aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Git tab complete branches
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

# --httptoolkit--
# This section will be reset each time a HTTP Toolkit terminal is opened
if [ -n "$HTTP_TOOLKIT_ACTIVE" ]; then
    # When HTTP Toolkit is active, we inject various overrides into PATH
    export PATH="/Applications/HTTP Toolkit.app/Contents/Resources/app/httptoolkit-server/overrides/path:$PATH"

    if command -v winpty >/dev/null 2>&1; then
        # Work around for winpty's hijacking of certain commands
        alias php=php
        alias node=node
    fi
fi
# --httptoolkit-end--export REQUESTS_CA_BUNDLE=/private/tmp/CMMCERTROOT-CA.pem
