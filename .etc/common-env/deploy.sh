if [[ ! $PWD == *"common-env"* ]]; then
	rsync --archive --exclude="deploy.sh" --exclude="raw/" --exclude="sc2*-titleslides/" --verbose . jureca.fz-juelich.de:/p/project/training2555/common/environment/
else
	echo "You seem to be in ./common-env/; please go up one dir."
fi