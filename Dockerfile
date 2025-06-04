FROM python:3.11-slim

WORKDIR /app

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 依存関係をインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションのコードをコピー
COPY . .

# 起動スクリプトに実行権限を付与
RUN chmod +x start.sh

# HerokuはPORT環境変数を使用
ENV PORT=5000

# 起動スクリプトを実行
CMD ["./start.sh"]