#!/usr/bin/bash

echo "[REACT] Starting $NODE_ENV server."
npm install
npm rebuild node-sass --force

if [ ! -d /code/frontend/build ] && [ $NODE_ENV = 'production' ]; then
    echo "[BUILD] Failed to detect build folder. Running yarn build..."
    cd /code/frontend/src
    npm build --production
fi

npm start
exec "$@"
