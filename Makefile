-include .env

# コンテナ起動
up:
	docker compose up -d

# コンテナ終了
stop:
	docker compose stop

# コンテナ停止および削除
down:
	docker compose down

# コンテナ侵入
apps:
	docker compose exec app /bin/bash

# モジュール初期化
mod-init:
	docker compose exec app go mod init ${APP_NAME}

# モジュールの精査
mod-tidy:
	docker compose exec app go mod tidy

# main.go実行
run:
	docker compose exec app go run main.go

# 例） make get ARG=モジュール名
get:
	docker compose exec app go get ${ARG}

# マルチステージビルド
multi-stage-build:
	docker build -t ${APP_NAME}:${APP_VERSION} -f multi_build/Dockerfile .

# マルチコンテナイメージ削除
multi-stage-delete:
	docker run -i --rm ${APP_NAME}:${APP_VERSION}