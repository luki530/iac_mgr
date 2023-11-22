#!/bin/bash

echo "Checking If node is OK:"
echo ruok | nc localhost 2181
echo ""
echo "Checking node state (follower/leader):"
STATE=$(echo mntr | nc localhost 2181 | grep zk_server_state)
echo $STATE
if [[ $(echo $STATE | cut -d ' ' -f2) == "leader" ]]
then
        echo "Checking number of synced followers:"
        echo mntr | nc localhost 2181 | grep zk_synced_followers
fi
