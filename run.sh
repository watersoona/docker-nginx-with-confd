#!/bin/sh
# set -eo pipefail
# verify environment variables are set
if [[ -z "$SERVER_NAME" ]]; then
  echo SERVER_NAME variable missing;
  exit 1;
fi

export ETCD_PORT=${ETCD_PORT:-2379}
export HOST_IP=${HOST_IP:-192.168.20.202}
export ETCD=$HOST_IP:2379

echo "[nginx] booting container. ETCD: $ETCD"


echo "start confd";

# Loop until confd has updated the nginx config
# until /bin/confd -onetime -backend etcdv3 -node $ETCD ; do
#   echo "[nginx] waiting for confd to refresh nginx.conf"
#   sleep 5
# done


/bin/confd -watch -node $ETCD -backend etcdv3 &
echo "[nginx] confd is listening for changes on etcd..."


# /bin/confd -watch  -backend etcdv3 -node $ETCD;

echo "end start confd"


echo "start nginx";

# generate configs
# /bin/confd -onetime -backend env

# start nginx foreground
exec /usr/sbin/nginx -g 'daemon off;'

# tail -f /var/log/nginx/*.log


