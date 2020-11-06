#!/bin/bash
set -e

# Template対象のファイルとsedコマンドにおいて
# {{}}で変数を囲うというルールを設けることで
# 意図しない変換が行われないようにする
# $~~は環境変数へのアクセス
# コンテナの環境変数はdocker composeファイルで設定している
sed -i "s|{{NGINX_HOST}}|$NGINX_HOST|;s|{{NGINX_PROXY}}|$NGINX_PROXY|" \
    /etc/nginx/conf.d/default.conf
cat /etc/nginx/conf.d/default.conf

# CMDが引数として渡されるのでシェルの特殊変数$@で
# アクセスして実行する
exec "$@"
