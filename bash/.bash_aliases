alias g1='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias ga='git add'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'
alias gs='git status'
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias loadtestschema='bundle exec rake db:schema:dump && bundle exec rake db:test:generate_schema && bundle exec rake db:test:load_testing_schema'
alias fupthetests='for i in `seq 20` ; do bundle exec rspec --order random --format progress ; [[ ! $? = 0 ]] && break ; done'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  alias ls="ls -GFlash --color"
elif [[ "$unamestr" == 'Darwin' ]]; then
  alias ls="ls -GFlash"
fi
