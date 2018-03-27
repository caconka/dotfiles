#!/bin/bash

# SDK
bash <(curl -s archibold.io/install/android)
sudo $ANDROID_HOME/tools/bin/sdkmanager "tools" "platform-tools" \
  "build-tools;25.0.3" "extras;android;m2repository" "extras;google;m2repository"

# nativescript & genymotion
npm i -g nativescript
pacaur -S --noconfirm genymotion
sudo vboxreload

