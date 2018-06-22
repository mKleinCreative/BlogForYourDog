docker-compose down && \
docker volume rm blogforyourdog_pgdata && \
docker volume rm blogforyourdog_frontend && \
docker volume rm blogforyourdog_backend && \
docker-compose --verbose up --build --abort-on-container-exit --force-recreate
