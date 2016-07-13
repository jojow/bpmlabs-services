#!/bin/bash
set -e

APP_NAME="bpmlabs-services"

if [ -z "$APP_DIR" ]; then
  APP_DIR="$HOME/$APP_NAME"
fi

NVM_DIR="$APP_DIR/.nvm"



source $NVM_DIR/nvm.sh

cd $APP_DIR

npm run start-forever



if [ -z "$STATIC_PORT" ]; then
  STATIC_PORT="8888"
fi

if [ -z "$STATIC_DIR" ]; then
  STATIC_DIR="$APP_DIR/public"
fi

mkdir -p $STATIC_DIR

npm run static-forever
