function jump() {
	local user=$1
	local bastion_ip=$2
	local instance_ip=$3
	local key=$4

	ssh -v \
	-F /dev/null \
	-i ${key} \
	${user}@${instance_ip} \
	-o StrictHostKeyChecking=no \
	-o "proxycommand ssh -W %h:%p -i $key -F /dev/null -o StrictHostKeyChecking=no ${user}@${bastion_ip}"
}

jump $1 $2 $3 $4
