#!/bin/bash

USERS=$(aws ssm get-parameters --names lsm.user.list | awk {'print $4'} | tr "," "\n")

for u_p in $USERS
do
  echo $u_p | sed -e 's/;/ * /' -e 's/$/ */'
done
