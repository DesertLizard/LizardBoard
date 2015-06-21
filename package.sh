#!/bin/sh
rm -rf /tmp/lizard
mkdir /tmp/lizard
cp plot/* /tmp/lizard
( cd /tmp
  rm -f lizard.zip
  zip -r lizard.zip lizard/ )
mv -f /tmp/lizard.zip .
  
