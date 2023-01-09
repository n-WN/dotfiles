# v2ray
echo v2ray:
sudo docker run -d \
--restart=always \
--name v2ray \
-v /etc/v2ray:/etc/v2ray \
--network host \
v2fly/v2fly-core \
run -c /etc/v2ray/config.json 


#alist
echo alist:
sudo docker run -d \
--restart=always \
-v /etc/alist:/opt/alist/data \
-p 5244:5244 \
--name="alist" \
xhofe/alist:latest

#memos
echo memos:
sudo docker run -d \
--restart=always \
--name memos \
-p 5230:5230 \
-v /etc/memos/:/var/opt/memos \
neosmemo/memos:latest

#vscode
echo vscode:
sudo docker run -d \
--name code-server \
-p 8080:8080 \
-v $HOME/.config:/home/coder/.config \
-v $PWD/project:/home/coder/project \
-u $(id -u):$(id -g) \
-e DOCKER_USER=$USER \
codercom/code-server:latest
