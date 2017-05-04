#!/bin/bash
cd /

wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz 
tar -xvf android-sdk*.tgz

git clone --depth 1 https://github.com/pliablepixels/zmNinja.git

mv /locale-fr.json /zmNinja/www/lang/locale-fr.json
mv /DataModel.js /zmNinja/www/js/DataModel.js

cd /android-sdk-linux/tools
sh android update sdk --no-ui --force
echo "export PATH=\${PATH}:$/android-sdk-linux/tools" >> ~/.bashrc
export PATH=$PATH:/android-sdk-linux/tools
cd ../platform-tools
echo "export PATH=\${PATH}:$/android-sdk-linux/platform-tools" >> ~/.bashrc
export PATH=$PATH:/android-sdk-linux/platform-tools
. ~/.bashrc	

mkdir ~/Desktop/
touch ~/Desktop/zmNinja.keystore

cd /zmNinja
npm install -g cordova ionic@beta
npm install -g gulp
npm install node-sass
npm install
ionic state restore


sh build_android.sh
ionic build android
