oh-my-posh init pwsh --config 'C:\Users\jyf\scoop\apps\oh-my-posh\current\themes\pure.omp.json' | Invoke-Expression
Import-Module Terminal-Icons

# Set-PSReadlineKeyHandler -Key Tab -Function Complete # 设置 Tab 键补全
Set-PSReadLineOption -PredictionSource History 
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete # 设置 Ctrl+d为菜单补全和
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo # 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -EditMode vi
Set-PSReadLineOption -BellStyle None

function pro { vim $profile }
function ll { ls.exe -al }
function l { ls.exe -al }

function pic {
	  Set-Clipboard (-join ('![](' , $(picgo u | tail -n 1),')' ))
	  Get-ClipBoard
}

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
