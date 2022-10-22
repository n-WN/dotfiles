# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

# 初始化补全
autoload -Uz compinit; compinit
zinit light Aloxaf/fzf-tab
# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit light zsh-users/zsh-completions

# zinit 出于效率考虑会截获 compdef 调用，放到最后再统一应用，可以节省不少时间
zinit cdreplay -q

# theme
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /home/jyf/.config/broot/launcher/bash/br

export EDITOR='nvim'
function setproxy() { 
    echo ------------
    echo "[ALL_PROXY]"
    host_ip=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")  
    echo $host_ip
    export HTTP_PROXY="http://$host_ip:32345"  
    export HTTPS_PROXY="http://$host_ip:32345"  
    export ALL_PROXY="http://$host_ip:32345"  
    echo "set proxy down" 

    echo -------------
    echo "[proxychains]"
    sudo sed -i.bak "/^socks5/c socks5 \t${host_ip} \t10809" /etc/proxychains.conf
    sudo sed -i "/^http/c http \t${host_ip} \t32345" /etc/proxychains.conf

    sudo sed -n "/^socks5/p " /etc/proxychains.conf
    sudo sed -n  "/^http/p " /etc/proxychains.conf
}
function unsetproxy() {
    export HTTP_PROXY=""
    export HTTPS_PROXY=""
    export ALL_PROXY=""
    echo "unset proxy down" 
}

alias ll="ls -la"
alias vim="nvim"
