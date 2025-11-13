if [[ ! $PWD == *"common-env"* ]]; then
	rsync --archive --exclude="deploy.sh" --exclude="raw/" --exclude="sc2*-titleslides/" --verbose . juwels-booster.fz-juelich.de:/p/project1/training2555/common/environment/
else
	echo "You seem to be in ./common-env/; please go up one dir."
fi