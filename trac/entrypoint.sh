#!/bin/bash

set -e

if [ ! -f project/conf/trac.ini ]; then
    if [ "$TRAC_PROJECT_NAME" == "" ]; then
        TRAC_PROJECT_NAME="Template Project"
    fi
    trac-admin project/ initenv "$TRAC_PROJECT_NAME" sqlite:db/trac.db
    trac-admin project/ permission add admin TRAC_ADMIN
fi

if [ ! -f project/.htpasswd ]; then
    if [ "$TRAC_ADMIN_PASSWORD" == "" ]; then
        TRAC_ADMIN_PASSWORD=`pwgen -s -1 20`
    fi
    htpasswd -bc project/.htpasswd admin $TRAC_ADMIN_PASSWORD
fi


CMD=$@
/bin/bash -c "$CMD"

