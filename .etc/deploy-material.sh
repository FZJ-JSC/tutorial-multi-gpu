if [[ ! $PWD == *"env"* ]]; then
	for sys in "juwels-booster.fz-juelich.de:/p/" "login.jupiter.fz-juelich.de:/e/"; do
		rsync --archive --exclude="*minified.pdf" --exclude="tut*" --exclude=".*" --exclude="*-sc*.pdf"  --verbose "../" "${sys}/project1/training2628/common/material/"
	done
else
	echo "You seem to be in ./env/; please go up one dir."
fi