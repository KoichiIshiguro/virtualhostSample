#!/bin/bash

# 引数チェック
if [ -z "$1" ]; then
    echo "Usage: $0 <domain-name>"
    exit 1
fi

# 同名の.confファイルが存在するかチェック
if [ -e "/etc/apache2/sites-available/${1}.conf" ]; then
    echo "Error: Configuration file /etc/apache2/sites-available/${1}.conf already exists!"
    exit 1
fi

# VirtualHostの設定を生成
cat << EOF > /etc/apache2/sites-available/${1}.conf
<VirtualHost *:80>
    ServerName $1
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/${1}/public

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

# VirtualHostの設定を有効にする
a2ensite ${1}.conf

# Apacheを再起動
systemctl reload apache2

# Let's Encryptの設定を行う
certbot --apache -d $1 -d www.$1
