#!/bin/bash

userlist=$(aws ssm get-parameters --names lsm.user.list | awk {'print $4'} | tr "," "\n")

for i in $userlist
do
  aws ssm get-parameters --names "$i" --with-decryption | awk {'print $4,$5,$6,$7'} >> test.txt
done
