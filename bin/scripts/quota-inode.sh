#!/bin/sh

# This code was originally created by Nikhil Waykole <nikhil.waykole@synerzip.com>
# https://github.com/nikhilwaykole/openshift-quota-monitor-cartridge/master/lib/functions

# returns the inode usage from quota command
function get_inode_usage() {
  echo $(quota |egrep -v '(quotas|Filesystem)'|awk -F ' ' '{ print $4}')
}

# returns the total inode quota for your gear
function get_inode_quota() {
  echo $(quota |egrep -v '(quotas|Filesystem)'|awk -F ' ' '{ print $6}')
}

used_inode=$(get_inode_usage)
inode_quota=$(get_inode_quota)
percentage=$(echo "(${used_inode}/${inode_quota})*100" |bc -l|sed 's/^\./0./')

current_inode_usage=${percentage/\.*}

echo "Current gear inode usage is ${current_inode_usage}%"
exit $current_inode_usage
