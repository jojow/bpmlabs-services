#!/bin/bash
set -e

APP_NAME="bpmlabs-services"

if [ -z "$APP_DIR" ]; then
  APP_DIR="$HOME/$APP_NAME"
fi

NVM_DIR="$APP_DIR/.nvm"



source $NVM_DIR/nvm.sh

cd $APP_DIR

export FOREVER_ROOT="$APP_DIR/.forever"

#forever -a -c "npm start" -l forever.log -o out.log -e err.log $APP_DIR
forever start -a -l forever.log -o out.log -e err.log $APP_DIR



if [ -z "$STATIC_PORT" ]; then
  STATIC_PORT="8888"
fi

if [ -z "$STATIC_DIR" ]; then
  STATIC_DIR="$APP_DIR/public"
fi

mkdir -p $STATIC_DIR

forever start -a -l forever.static.log -o out.static.log -e err.static.log $APP_DIR/node_modules/http-server/bin/http-server $STATIC_DIR -p $STATIC_PORT --cors
