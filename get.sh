#!/bin/bash

PHP_PATH=$(which php)
if [[ -z "$PHP_PATH" ]]; then
  echo "PHP not found!"
  exit 1
fi

CURL_PATH=$(which curl)
if [[ -z "$CURL_PATH" ]]; then
  echo "Curl not found!"
  exit 1
fi

COMPOSER_LATEST_URL=$(curl -sSL https://api.github.com/repos/composer/composer/releases/latest | grep '/composer.phar"' | cut -d '"' -f 4)

echo "Download composer cli from: $COMPOSER_LATEST_URL"

if [[ ! -d "/usr/local/bin" ]]; then
  mkdir -p /usr/local/bin
fi

curl -sSL "$COMPOSER_LATEST_URL" -o /usr/local/bin/composer-cli
chmod 755 /usr/local/bin/composer-cli

composer-cli -n -V

exit 0
