if [[ ! $PWD == *"common-env"* ]]; then
	for sys in "juwels-booster.fz-juelich.de:/p/" "login.jupiter.fz-juelich.de:/e/"; do
		rsync --archive --exclude="deploy.sh" --exclude="raw/" --exclude="sc2*-titleslides/" --verbose "./" "${sys}/project1/training2628/common/environment/"
	done
else
	echo "You seem to be in ./common-env/; please go up one dir."
fi