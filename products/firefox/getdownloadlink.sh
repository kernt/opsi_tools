#!/bin/bash -x
################################################################################
# Datum: Di 09 Apr 2013 12:35:00 CEST
# Scipt: getdownloadlink.sh
# Author: Tobias Kern
# Kontakt: https://github.com/kernt/
# Info: es werden keine uebergabeparameter erwartet.
#
# USE:
# zum Testen
# #!/bin/bash -u reiner syntax scheck (Testmodus)
################################################################################

LANG=de_DE.UTF-8
LANGUAGE=de_DE.UTF-8

OS="win"
LANG="de"


# Erzeugt den Aktuellen link zum Download mit wget
# wird aber mal gaendert von mozilla
getUrl ()
{
LINK="$(lynx -source -assume_charset=utf8 -preparsed http://www.mozilla.org/en-US/firefox/all/|grep "os=$OS"|grep "lang=$LANG"|grep "product=firefox-*"| sed 's/'HREF'/'LINKFIREFOX'/g' | sed 's/'amp\;'/''/g' )"
echo $LINK
}

getUrl > downlink.link

exit 0
