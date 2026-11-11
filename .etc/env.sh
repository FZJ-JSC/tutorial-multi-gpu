export JSCCOURSE_PROJECT=training2660
export JSCCOURSE_SHORTNAME=SC26-Multi-GPU-Tutorial
export JSCCOURSE_HUMANNAME="SC26 Tutorial on Multi-GPU Computing for Exascale"

# Note: Reservations are not properly supported

# Determine base directory for jsccourse project
if [ -d "/e/project1/$JSCCOURSE_PROJECT" ]; then
  _BASEDIR="/e/project1/$JSCCOURSE_PROJECT"
elif [ -d "/p/project1/$JSCCOURSE_PROJECT" ]; then
  _BASEDIR="/p/project1/$JSCCOURSE_PROJECT"
fi

if [ -n "${_BASEDIR:-}" ]; then
  source "${_BASEDIR}/common/environment/common-env/jsccourse-bashrc.sh"
else
  echo "Error: project directory not found for $JSCCOURSE_PROJECT" >&2
  exit 1
fi
