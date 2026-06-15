#!/usr/bin/env bash

set -x

course_project=${1:-$PROJECT_training2630}

for user in chawla2 rajski1 dabah2 bode5 herten1 ; do
	setfacl -m u:$user:rwx -R $course_project/common/
	setfacl -m u:$user:rwx -R $course_project/env.sh
done

set +x
