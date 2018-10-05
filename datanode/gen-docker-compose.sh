if [ "$1" == "" ]
then
  echo "Usage: $0 numnodes"
  exit 1
fi
for nodenum in $(seq 1 $1)
do
cat << EOF
datanode${nodenum}:
  image: uhopper/hadoop-datanode
  hostname: datanode${nodenum}
  container_name: datanode${nodenum}
  domainname: hadoop
  net: hadoop
  ports:
    - "50075"
  volumes:
     - datanode${nodenum}:/hadoop/dfs/data
  environment:
     - GANGLIA_HOST=localhost
     - CORE_CONF_fs_defaultFS=hdfs://ercluster:8020
EOF
done
