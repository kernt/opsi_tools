#!/bin/bash -x

LANG=de_DE.UTF-8
LANGUAGE=de_DE.UTF-8

OS="win"
LANG="de"


# Erzeugt den Aktuellen link zum Download mit wget
getUrl ()
{
LINK="$(lynx -source -assume_charset=utf8 -preparsed http://www.mozilla.org/en-US/firefox/all/|grep "os=$OS"|grep "lang=$LANG"|grep "product=firefox-*"| sed 's/'HREF'/'LINKFIREFOX'/g' | sed 's/'amp\;'/''/g' )"
echo $LINK
}

getUrl > downlink.link

exit 0
