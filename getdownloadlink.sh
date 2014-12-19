#!/bin/bash -x
#
# Script-Name : getdownloadlink.sh
# Version : 0.01
# Autor : Tobias Kern
# Datum : 10.02.2011
# Lizenz : GPLv3
# Depends : none
# Use : 
#
# Example:
#
# Description:
###########################################################################################
## Some Info and so one.
##
###########################################################################################
LANG=de_DE.UTF-8
LANGUAGE=de_DE.UTF-8

OS="win"
LANG="de"

# Erzeugt den Aktuellen link zum Download mit wget
_getUrl ()
{
LINK="$(lynx -source -assume_charset=utf8 -preparsed http://www.mozilla.org/en-US/firefox/all/|grep "os=$OS"|grep "lang=$LANG"|grep "product=firefox-*"| sed 's/'HREF'/'LINKFIREFOX'/g' | sed 's/'amp\;'/''/g' )"
echo $LINK
}

_getUrl > downlink.link

exit 0
