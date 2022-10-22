# C:\Users\jyf\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
oh-my-posh init pwsh --config 'C:\Users\jyf\scoop\apps\oh-my-posh\current\themes\pure.omp.json' | Invoke-Expression
function pro { vim $profile }

function setproxy{
		$env:HTTP_PROXY="127.0.0.1:10809" 
		$env:HTTPS_PROXY="127.0.0.1:10809"
		echo "set proxy done"
		showproxy
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

function connect{
	rasdial connect w200855110@cmcc 10003X
}

function disconnect{
	rasdial /disconnect
}
function proxy{
	inetcpl
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
