#!/bin/bash -x

SED=$(which sed);

#
# config optimizer for neo4j
#

CASSANDRA_ENV_FILE="${OPENSHIFT_CASSANDRA_DIR}/versions/1.2.5/conf/cassandra-env.sh";

 [ -z "$XMS" ] && { XMS=32; }
  memory_total=`free -m | grep Mem | awk '{print $2}'`;
   [ -z "$XMX" ] && { let "XMX=(memory_total-35)/2"; XMX="${XMX}";  }

   $SED -i "s/^MAX_HEAP_SIZE=.*/MAX_HEAP_SIZE=${XMX}/" $CASSANDRA_ENV_FILE;

