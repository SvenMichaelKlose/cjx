#!/bin/sh

#scp -rC css js index.html copei.de:/wwwroot/copei.de/www/pi/admin/
rsync -av --rsh=ssh js copei.de:/wwwroot/copei.de/www/pi/admin/
rsync -av --rsh=ssh index.html copei.de:/wwwroot/copei.de/www/pi/admin/
