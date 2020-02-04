set -xe

function jump() {
	local bastion_user=$1
	local bastion_ip=$2
	local bastion_key=$3
	local instance_user=$4
	local instance_ip=$5
	local instance_key=$6

	ssh -v \
	-F /dev/null \
	-i ${instance_key} \
	${instance_user}@${instance_ip} \
	-o StrictHostKeyChecking=no \
	-o "proxycommand ssh -W %h:%p -i $bastion_key -F /dev/null -o StrictHostKeyChecking=no ${bastion_user}@${bastion_ip}"
}

jump $@
