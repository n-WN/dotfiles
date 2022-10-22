#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
PS1='[\u@\h \W]\$ '

function setproxy() { 
	echo ------------
	echo [ALL_PROXY]
	host_ip=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")  
	echo $host_ip
	export HTTP_PROXY="http://$host_ip:32345"  
	export HTTPS_PROXY="http://$host_ip:32345"  
	export ALL_PROXY="http://$host_ip:32345"  
	echo "set proxy down" 

	echo -------------
	echo [proxychains]
	sudo sed -i.bak "/^socks5/c socks5 \t${host_ip} \t10809"
	/etc/proxychains.conf
	sudo sed -i "/^http/c http \t${host_ip} \t32345"
	/etc/proxychains.conf

	sudo sed -n "/^socks5/p " /etc/proxychains.conf
	sudo sed -n  "/^http/p " /etc/proxychains.conf
}
function unsetproxy() {
	export ALL_PROXY=""
	echo "unset proxy down" 
}
