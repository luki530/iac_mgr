#cloud-config

fqdn: ${agentFqdn}
hostname: ${agentHostname}
manage_etc_hosts: true

write_files:
- path: /tmp/setup_zookeeper.sh
  permissions: '0755'
  content: |
    #!/bin/bash

    set -e
    set -x

    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600") 
    AGENT_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)    
    echo "$AGENT_IP ${agentFqdn}" >> /etc/hosts

    ######################### Zookeeper configuration
    export MAX_HEAP_SIZE=${max_heap_size}
    export ZOOKEEPER_ID=${zookeeper_id}

    cp /opt/zookeeper/conf/java.env /opt/zookeeper/conf/java.env.tmp
    envsubst '$MAX_HEAP_SIZE' < /opt/zookeeper/conf/java.env.tmp > "/opt/zookeeper/conf/java.env"
    echo "${zookeeper_id}" > /opt/zookeeper/data/myid
    
    %{ for node in zookeeper_nodes ~}
    echo "${node}" >> /opt/zookeeper/conf/zoo.cfg
    %{ endfor ~}

runcmd:
- prepare_storage /opt/zookeeper/data zookeeper zookeeper
- /tmp/setup_zookeeper.sh
- /usr/sbin/enable_and_start_service zookeeper.service
