#!/bin/bash -uex

if [ -d "/tmp/FSLogix" ]; then
  rm -rf /tmp/FSLogix
fi

if [ -f "/tmp/FSLogix.zip" ]; then
  rm -f /tmp/FSLogix.zip
fi

wget --progress=bar:force -O /tmp/FSLogix.zip 'https://aka.ms/fslogix_download'

unzip /tmp/FSLogix.zip -d /tmp/FSLogix/
