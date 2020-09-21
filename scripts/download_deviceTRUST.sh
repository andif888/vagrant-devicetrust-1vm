#!/bin/bash -uex

if [ -d "/tmp/deviceTRUST" ]; then
  rm -rf /tmp/deviceTRUST
fi

if [ -f "/tmp/deviceTRUST.zip" ]; then
  rm -f /tmp/deviceTRUST.zip
fi

wget --progress=bar:force -O /tmp/deviceTRUST.zip 'https://storage.devicetrust.com/download/deviceTRUST-20.1.200.zip'

unzip /tmp/deviceTRUST.zip -d /tmp/deviceTRUST/
