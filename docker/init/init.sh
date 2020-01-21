#!/usr/bin/env bash
cp /badgr/init/settings_local.py.example /badgr/code/apps/mainsite/settings_local.py

echo "Waiting for mysql"
CNT=0
MAX=100
until mysql -h"mysql_host" -u"badgr" -p"badgr" &> /dev/null
do
        echo "Waiting for mysql: $CNT"
        sleep 1
        let CNT=CNT+1
        if [ $CNT -eq $MAX ] ; then
            break
        fi
done

cd /badgr
source env/bin/activate
cd /badgr/code
./manage.py migrate
./manage.py dist
./manage.py runserver 0:8000 &
cd /badgr/badgr-ui
source ~/.bash_profile
npm run start -- --host 0.0.0.0



