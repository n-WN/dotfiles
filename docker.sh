# v2ray
sudo docker run -d --name v2ray -v /etc/v2ray:/etc/v2ray -p 10086:10086 v2fly/v2fly-core run -c /etc/v2ray/config.json 


#alist
sudo docker run -d \
--restart=always \
-v /etc/alist:/opt/alist/data \
-p 5244:5244 \
--name="alist" \
xhofe/alist:latest
