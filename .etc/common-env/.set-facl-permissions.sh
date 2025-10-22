#!/usr/bin/env bash

set -x

course_project=${1:-$PROJECT_training2555}

for user in haghighimood1 kraus1 hrywniak1 oden1 garciadegonzalo1 badwaik1 john2 appelhans1; do
	setfacl -m u:$user:rwx -R $course_project/common/
	setfacl -m u:$user:rwx -R $course_project/env.sh
done

set +x
