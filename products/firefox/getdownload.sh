#!/bin/bash
# Datum: Di 09 Apr 2013 12:35:00 CEST
# Scipt: getdownload.sh
# Author: Tobias Kern
# Kontakt: https://github.com/kernt/
# Info: es werden keine uebergabeparameter erwartet.
#
# USE:
# zum Testen
# #!/bin/bash -u reiner syntax scheck (Testmodus)
################################################################################
. ./downlink.link

cd CLIENT_DATA/

wget $LINKFIREFOX -O current_Firefox.exe

exit 0
