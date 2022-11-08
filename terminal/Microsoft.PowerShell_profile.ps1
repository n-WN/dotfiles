oh-my-posh init pwsh --config 'C:\Users\jyf\scoop\apps\oh-my-posh\current\themes\pure.omp.json' | Invoke-Expression
Import-Module posh-git
Import-Module PSFzf
Import-Module -Name Terminal-Icons
Import-Module PSReadLine


# Set-PSReadlineKeyHandler -Key Tab -Function Complete # 设置 Tab 键补全
Set-PSReadLineOption -PredictionSource History 
Set-PSReadLineKeyHandler -Key Tab  -Function MenuComplete # 设置 Ctrl+d为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo # 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward #设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward #设置向下键为前向搜索历史纪录
Set-PSReadLineOption -EditMode vi
Set-PSReadLineOption -BellStyle None

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

function pro { vim $profile }
function ll { ls.exe -la }

function setproxy{
	$env:HTTP_PROXY="127.0.0.1:10809" 
		$env:HTTPS_PROXY="127.0.0.1:10809"
		echo "set proxy done"
		showproxy
}
function setsock{
	$env:HTTP_PROXY="socks://127.0.0.1:10809"
		$env:HTTPS_PROXY="socks://127.0.0.1:10809"
}

function unsetproxy{
	$env:HTTP_PROXY=""
		$env:HTTPS_PROXY=""
		echo "unset proxy done"
}

function showproxy{
	echo "env:HTTP_PROXY = $env:HTTP_PROXY" 
		echo "env:HTTPS_PROXY = $env:HTTPS_PROXY" 
}

function vmkill{
	taskkill /F /IM vmware.exe
		net stop vmware-view-usbd
		net stop VMwareHostd
		net stop VMAuthdService
		net stop VMUSBArbService
		taskkill /F /IM vmware-tray.exe
		exit
}
