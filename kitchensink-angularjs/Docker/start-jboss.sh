#!/bin/bash

if [[ $# -eq 1 && $1 == "--wait-db" ]]; then
  ret=1
  while [[ $ret -ne 0 ]]; do
    ret=$(curl -s mariadb:3306 >/dev/null && echo 0 || echo 1)
  done
  /opt/jboss/jboss-eap-7.0/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
else
  /opt/jboss/jboss-eap-7.0/bin/standalone.sh &
fi
