Invoke-Expression (&starship init powershell)

$PSStyle.FileInfo.Directory = "`e[34m"

Set-PSReadLineOption -EditMode vi
Set-PSReadLineOption -PredictionSource History 
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -BellStyle None

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

function pro { vim $profile }
function ll { ls.exe -al }
function l { ls.exe -al }
function rmhis { Remove-Item $Env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt }

function setproxy{
	$env:HTTP_PROXY="127.0.0.1:10809" 
		$env:HTTPS_PROXY="127.0.0.1:10809"
		echo "set proxy done"
		showproxy
}
function setsock{
	$env:HTTP_PROXY="socks://127.0.0.1:10808"
    $env:HTTPS_PROXY="socks://127.0.0.1:10808"
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
