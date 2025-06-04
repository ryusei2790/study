#!/usr/bin/env bash
# start.sh

# 環境変数からポート番号を取得（Heroku用）
export PORT=${PORT:-5000}

# Gunicornでアプリケーションを起動
gunicorn --bind 0.0.0.0:$PORT app:app