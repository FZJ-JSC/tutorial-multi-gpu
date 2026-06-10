if [[ ! $PWD == *"env"* ]]; then
	rsync --archive --exclude="*minified.pdf" --exclude="tut*" --exclude=".*" --exclude="*-sc*.pdf"  --verbose .. jupiter.fz-juelich.de:/e/project1/training2630/common/material/
else
	echo "You seem to be in ./env/; please go up one dir."
fi