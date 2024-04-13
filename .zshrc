PS1='%n@%m %~ %# '
ZSH_THEME="agnoster"

export PATH=$PATH:/usr/local/bin/code
export PATH=$PATH:/usr/local/share/dotnet/x64
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib

# python conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# python conda end

autoload -Uz compinit && compinit

# aws
aws_env() {
    export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $1);
    export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $1);
    export AWS_DEFAULT_REGION=$(aws configure get region --profile $1);
    echo "$1 environment variables exported";
}
# aws end

[ -f "/Users/maxpaj/.ghcup/env" ] && source "/Users/maxpaj/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun 
[ -s "/Users/maxpaj/.bun/_bun" ] && source "/Users/maxpaj/.bun/_bun"
export BUN_INSTALL="/Users/maxpaj/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun end

# pnpm
export PNPM_HOME="/Users/maxpaj/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# deno
export DENO_INSTALL="/Users/maxpaj/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
# deno end

# opam 
[[ ! -r /Users/maxpaj/.opam/opam-init/init.zsh ]] || source /Users/maxpaj/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
# opam end

# fnm
export PATH="/Users/maxpaj/Library/Application Support/fnm:$PATH"
eval "$(fnm env --use-on-cd)"
# fnm end

echo 'Loaded ~/.zshrc'