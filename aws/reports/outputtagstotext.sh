echo ""
  echo "================================================================="

while read $1
do
    running_instances=` aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" "Name=instance-state-name,Values=running" | grep "InstanceId"  | wc -l`

stopped_instances=` aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" "Name=instance-state-name,Values=stopped" | grep "InstanceId"  | wc -l`


  echo "|                       $appowner                               "
  echo "|                      ----------                               |"
  echo "|                                                               |"
  echo "| Total instances are running = $running_instances         "
  echo "| Total instances are stopped = $stopped_instances         "
  echo "|                                                               |"
  echo "_________________________________________________________________"
done < tags.txt
