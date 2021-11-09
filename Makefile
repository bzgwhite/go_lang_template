-include .env

# コンテナ起動
up:
	docker compose up -d

# コンテナ終了
stop:
	docker compose stop

# コンテナ停止および削除
stop:
	docker compose down

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
	docker comose exec app go get ${ARG}

# マルチステージビルド
multi-stage-build:
	docker build -t ${APP_NAME}:${APP_VERSION} -f multi_build/Dockerfile .

# マルチコンテナ実行
multi-stage-build:
	docker run -i --rm ${APP_NAME}:${APP_VERSION}