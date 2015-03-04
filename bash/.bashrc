export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export EDITOR=vim
# for prompt, only show username if it isn't me or a different host
if [[ $(hostname -f) == "CMDVMOSXLT048.local" && $(id -u) == 85708632 ]];then
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

# Chruby if you ever need more than one ruby version (only for mac)
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
	source /usr/local/share/chruby/chruby.sh
	chruby ruby-2.0.0-p353
fi
