#!/bin/bash
# Script : getdownload.sh
# Author : Tobias Kern
#
#
#
#
#
# Info  : Da man nicht die version die heruntergeleden wurde mit boardmitel herausbekomme kann, ist noch ein blick auf die folgede Webadresse notwendig
# http://www.adobe.com/de/software/flash/about/ notwendig. Hier kann mit hilfe von grep und awk auch nach der aktullen Version von flash gesucht werden.
# Am besten ist hierfuer der Tag
#...                                    <table class="data-borad max"> <tbody>
#                                       <tr></tr>
#                                       <tr>
#                                       <td rowspan="4">
#                                       <tr></tr>
#                                       <tr>$FLASHVERSION</tr>
# ...
# zu verwenden, da er eindeutig auffindbar ist und weiter verarbeitet werden kann.
# cat < index.html  | grep -A 1 '<td>Internet Explorer (und andere Browser, die Internet Explorer ActiveX-Steuerelemente und Plug-ins unterst&uuml;tzen)</td>' | tail -n1
# die <td></td> tags müssten noch entvernt werden.

SCRIPTNAME=$(basename $0.sh)
EXIT_SUCCESS=0
EXIT_FAILURE=1
EXIT_ERROR=2
EXIT_BUG=10


# Download der .exe fuer den IE

LINK="http://download.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_11_active_x.exe"
DATADIR=CLIENT_DATA
cd ${DATADIR}
wget $LINK
rm -f install_flash_player_11_active_x_64bit.exe
mv install_flash_player_11_active_x.exe install_flash_player_11_active_x_64bit.exe

# Download fuer den Firefox Browser.
#

LINK="http://download.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_11_plugin.exe"
wget ${LINK}
rm -f install_flash_player_11_plugin_64bit.exe
mv install_flash_player_11_plugin.exe install_flash_player_11_plugin_64bit.exe  # umbenenung fuer eine einheitliche namensgebung in opsi.


cd ..

# Version von flash in flashversion.info schreiben.
#su -c "touch ./flashversion.info"

# about index.html downloaden.
getFlashVerUrl=$(wget http://www.adobe.com/de/software/flash/about/)
getFlashVersion=$(cat < index.html  | grep -A 1 '<td>Internet Explorer (und andere Browser, die Internet Explorer ActiveX-Steuerelemente und Plug-ins unterst&uuml;tzen)</td>' | tail -n1 | sed 's/<[^>]\+>//g' | sed -e 's/ //g'i > flashversion.info)

# system aufreumen
rm -f index.html

exit $EXIT_SUCCESS
