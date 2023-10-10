#!/usr/bin/env bash

set -x

for user in haghighimood1 kraus1 hrywniak1 oden1 garciadegonzalo1 badwaik1 john2; do
	setfacl -m u:$user:rwx -R $PROJECT_training2332/common/
	setfacl -m u:$user:rwx -R $PROJECT_training2332/env.sh
done

set +x