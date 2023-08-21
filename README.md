virtual Host + Lets Encriptの設定

条件：ubuntuで確認
1, cerboがインストールされている
2, されてない場合はインストール
``` sh
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot python3-certbot-apache
```

サーバーでの設定方法
domain.comに設定すると仮定して以下の手順

1, ipアドレスをサーバーに向ける
　　　　　　ドメインのサイトで設定
      
2,ipアドレス設定が反映されたことを確認して、以下のコマンドを叩く
``` sh
sudo sh vh.sh domain.com
```
