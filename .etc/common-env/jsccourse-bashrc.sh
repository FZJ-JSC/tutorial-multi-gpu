# The following modifications exist
#
# - $JSCCOURSE_PROJECT: Something like "training2024"; used to generate the path
# - $JSCCOURSE_SHORTNAME: Something like "CUDA-Course"; used as destination in $HOME
# - $JSCCOURSE_HUMANNAME: Something like "CUDA Course 2024: Foundations"; used in banner
#
# Further, more hidden variables exist, mostly for debugging
# 
# - $partition: To override the partition for Slurm
# - $_JSCCOURSE_OVERRIDE_LOCALE: Usually we override the locale; setting this variable prevents it
# 
# Expose more functionality if needed.
#
# - A. Herten, Jun 2024


if [ -z "$_JSCCOURSE_ENV_SOURCED" ]; then
	project="training2502"
	_JSCCOURSE_PROJECT=${JSCCOURSE_PROJECT:-$project}
	_JSCCOURSE_SHORTNAME=${JSCCOURSE_SHORTNAME:-"GPU-Course"}
	_JSCCOURSE_HUMANNAME=${JSCCOURSE_HUMANNAME:-"GPU Course"}
	__SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
	
	temp_var="PROJECT_$_JSCCOURSE_PROJECT"
	export JSCCOURSE_DIR_GROUP=${!temp_var}

	export _JSCCOURSE_ENV_SOURCED="$(date)"

	jutil env activate -p $JSCCOURSE_PROJECT -A $JSCCOURSE_PROJECT

	currentday=$(date +%d)
	if [[ "$currentday" == "16" ]]; then
		res="--reservation sc25-multigpu-tut"
	fi
	
	export SLURM_NTASKS=1

	export _JSCCOURSE_GPU_ARCH='80'
    JSC_SUBMIT_CMD_SYSTEM_SPECIFIC_OPTIONS=""
	# export SLURM_GRES=gpu:4
	# SALLOC_GRES and SBATCH_GRES are not yet available
	case $SYSTEMNAME in 
		jusuf)
			ngpus=1
			export NP=2
			export PSP_CUDA_ENFORCE_STAGING=1
			JSC_SUBMIT_CMD_SYSTEM_SPECIFIC_OPTIONS="--ntasks-per-node 1 --disable-dcgm"
			partition=${partition:-gpus}
			export _JSCCOURSE_GPU_ARCH='70'
			;;
		juwels|juwelsbooster)
			ngpus=4
			export NP=4
			partition=${partition:-booster}
			JSC_SUBMIT_CMD_SYSTEM_SPECIFIC_OPTIONS="--disable-dcgm"
			export _JSCCOURSE_GPU_ARCH='80'
			;;
		jurecadc)
			ngpus=4
			export NP=4
			partition=${partition:-dc-gpu}			
			JSC_SUBMIT_CMD_SYSTEM_SPECIFIC_OPTIONS="--disable-dcgm"
			export _JSCCOURSE_GPU_ARCH='80'
			;;
		jupiter)
			ngpus=4
			export NP=4
			partition=${parittion:-booster}
			# JSC_SUBMIT_CMD_SYSTEM_SPECIFIC_OPTIONS="--gpus-per-task=1"
			export _JSCCOURSE_GPU_ARCH='90'
			;;
		*)
			echo "This system is not yet tested, setting ngpus=4"
			ngpus=4
			;;
	esac

	export JSC_BATCH_CONFIG="$res --partition ${partition:-booster} --gres=gpu:$ngpus $JSC_SUBMIT_CMD_SYSTEM_SPECIFIC_OPTIONS --time 0:10:00"
	export JSC_ALLOC_CMD="salloc $JSC_BATCH_CONFIG" 
	export JSC_SUBMIT_CMD="${JSC_ALLOC_CMD} srun --cpu-bind=sockets --unbuffered"
	
	export _JSC_MATERIAL_SYNC="rsync --archive --update --exclude='.*' --exclude='.*/' $JSCCOURSE_DIR_GROUP/common/material/ ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	export _JSC_MATERIAL_SYNC_FORCE="rsync --archive --exclude='.*' --exclude='.*/' $JSCCOURSE_DIR_GROUP/common/material/ ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"


	export PS1="\[\033[0;34m\]Ⓒ\[\033[0m\] $PS1"

	if [[ -z "${_JSCCOURSE_OVERRIDE_LOCALE}" ]]; then
		export LC_ALL=en_US.UTF-8
		export LANG=en_US.UTF-8
		export LANGUAGE=en_US.UTF-8
	fi

	# export UCX_WARN_UNUSED_ENV_VARS=n

	# User specific aliases and functions
	alias ls='ls --color=auto'
	alias ll='ls -lh'
	alias la='ls -la'
	alias laa='ls -la|pg'
	alias l='ll'
fi

if [[ $- =~ "i" ]]; then
	for script_rel in modules.sh; do
		abs_script=$__SCRIPT_DIR/$script_rel
		if [ -e $abs_script ]; then
			source $abs_script
		fi
	done
	export MPI_HOME=$EBROOTOPENMPI


	alias jsc-material-sync='bash -c "eval $_JSC_MATERIAL_SYNC"'
	alias jsc-material-sync-force='bash -c "eval $_JSC_MATERIAL_SYNC_FORCE"'
	alias jsc-material-reset-01="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/01-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-02="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/02-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-03="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/03-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-04="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/04-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-05="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/05-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-06="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/06-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-07="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/07-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-08="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/08-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-09="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/09-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-10="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/10-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"
	alias jsc-material-reset-11="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/11-* ${JSCCOURSE_DIR_USER:-$HOME}/${_JSCCOURSE_SHORTNAME}/"

	echo ""
	echo "*******************************************************************************"
	echo "              Welcome to ${_JSCCOURSE_HUMANNAME}"
	# echo " A default call to get a batch system allocation is stored in \$JSC_ALLOC_CMD!"
	# echo " Use it with \`eval \$JSC_ALLOC_CMD\`. The value of \$JSC_ALLOC_CMD is:"
	# echo -n "  "
	# echo $JSC_ALLOC_CMD | fold -w 80 -s
	echo " Submit a job to the batch system with \`\$JSC_SUBMIT_CMD\`"
	echo " The value of \$JSC_SUBMIT_CMD is:"
	echo " " $JSC_SUBMIT_CMD | fold -w 80 -s
	echo " Some modules have been loaded into the environment. See them with"
	echo " \`module list\`."
	echo " Synchronize the master material folder to your own by calling"
	echo " \`jsc-material-sync\`"
	echo "*******************************************************************************"

fi
