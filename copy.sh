#!/bin/bash

LOCALDIR=`cd "$( dirname $0 )" && pwd`
cd $LOCALDIR

cp -frp ./other/* ./X/
chmod 777 -R ./X
