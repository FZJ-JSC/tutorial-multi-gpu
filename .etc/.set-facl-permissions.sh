#!/usr/bin/env bash

set -x

for user in haghighimood1 kraus1 hrywniak1 oden1 garciadegonzalo1; do
	setfacl -m u:$user:rwx -R $PROJECT_training2124/common/
	setfacl -m u:$user:rwx -R $PROJECT_training2124/env.sh
done

set +x