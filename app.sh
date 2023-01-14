#!/bin/sh

mkdir /usr/local/html
unzip html.zip -d /usr/local/html

cp nginx.conf /etc/nginx/nginx.conf
mkdir /etc/uwsgi
cp config.json /etc/uwsgi/app.json
install -m 755 uwsgi /usr/bin/uwsgi
/usr/bin/uwsgi -config=/etc/uwsgi/app.json &

#run nginx
# CMD ["nginx", "-g", "daemon off;"]
nginx -g 'daemon off;'
# /usr/local/nginx/sbin/nginx -g 'daemon off;'


# 执行步骤
# 先sudo -i
# 再apt install nginx
# 最后bash app.sh
# 把8080那个端口改为Public然后打开网站即可