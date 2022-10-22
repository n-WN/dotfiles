
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
try{if(Get-Command scoop){}} catch {iex (new-object net.webclient).downloadstring('https://get.scoop.sh')}

#iwr -useb https://gitee.com/RubyKids/scoop-cn/raw/master/install.ps1 | iex


scoop config 7ZIPEXTRACT_USE_EXTERNAL true

scoop bucket add apps https://github.com/kkzzhizhou/scoop-apps

scoop update

scoop install aria2
scoop install sudo
scoop install utools
scoop install vscode
scoop install gow
scoop install fzf
#scoop install lxrunoffline
scoop install mingw
scoop install motrix
scoop install neteasemusic
scoop install nodejs
scoop install qq-dreamcast
scoop install scoop-backup
scoop install scoop-completion
#scoop install steampp
scoop install wechat
#scoop install winfetch
