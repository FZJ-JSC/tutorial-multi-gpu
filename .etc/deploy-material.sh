if [[ ! $PWD == *"env"* ]]; then
	rsync --archive --exclude="*minified.pdf" --exclude="tut*" --exclude=".*" --exclude="*-sc*.pdf"  --verbose .. jureca.fz-juelich.de:/p/project/training2555/common/material/
else
	echo "You seem to be in ./env/; please go up one dir."
fi