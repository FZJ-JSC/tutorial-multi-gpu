if [[ ! $PWD == *"common-env"* ]]; then
	rsync --archive --exclude="deploy.sh" --exclude="raw/" --exclude="hpc-ai*-titleslides/" --verbose . login.jupiter.fz-juelich.de:/e/project1/training2630/common/environment/
else
	echo "You seem to be in ./common-env/; please go up one dir."
fi