################################################
# JSC Course bashrc
#
# This file is usually called "env.sh" and is to be loaded as the very first part of a course; it setups environment variables and commands which are relied upon in the course.
#
# There are a number of opportunities to steer variables in this script from the outside.
#  * $JSCCOURSE_DIR_LOCAL_BASE: If this variable is set, it will be used within the target to rsync the material to. In this folder, the course folder will be created. It defaults to $HOME
#  * $partition: If this variable is set, it will be used to specify the partition to run on. It has a system-specific default
#  * $_JSCCOURSE_OVERRIDE_LOCALE: If this variable is set (to anything), this env.sh will not set all locale stuff to en_US.UTF-8
#
# Andreas Herten, >2017
################################################
if [ -z "$_JSCCOURSE_ENV_SOURCED" ]; then
	project="training2555"

	export JSCCOURSE_DIR_GROUP=/p/project1/$project
	export JSCCOURSE_DIR_LOCAL=${JSCCOURSE_DIR_LOCAL_BASE:-$HOME}/SC25-Multi-GPU-Tutorial

	export _JSCCOURSE_ENV_SOURCED="$(date)"
	export C_V_D="0,1,2,3"

	jutil env activate -p $project -A $project

	res=""
	currentday=$(date +%d)
	if [[ "$currentday" == "13" ]]; then
		res="--reservation sc25-mgpu"
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
		juwelsbooster)
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

	export JSC_BATCH_CONFIG="$res --partition ${partition} --gres=gpu:$ngpus $JSC_SUBMIT_CMD_SYSTEM_SPECIFIC_OPTIONS --time 0:10:00"
	export JSC_ALLOC_CMD="salloc $JSC_BATCH_CONFIG" 
	# export JSC_SUBMIT_CMD="srun $JSC_BATCH_CONFIG --pty"
	export JSC_SUBMIT_CMD="${JSC_ALLOC_CMD} srun --cpu-bind=sockets --pty"
	
	export _JSC_MATERIAL_SYNC="rsync --archive --update --exclude='.*' --exclude='.*/' $JSCCOURSE_DIR_GROUP/common/material/ $JSCCOURSE_DIR_LOCAL"
	export _JSC_MATERIAL_SYNC_FORCE="rsync --archive --exclude='.*' --exclude='.*/' $JSCCOURSE_DIR_GROUP/common/material/ $JSCCOURSE_DIR_LOCAL"


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
	for script in modules.sh; do
		abs_script=$JSCCOURSE_DIR_GROUP/common/environment/$script
		if [ -e $abs_script ]; then
			source $abs_script
		fi
	done

	alias jsc-material-sync='bash -c "eval $_JSC_MATERIAL_SYNC"'
	alias jsc-material-sync-force='bash -c "eval $_JSC_MATERIAL_SYNC_FORCE"'
	alias jsc-material-reset-01="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/01-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-02="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/02-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-03="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/03-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-04="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/04-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-05="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/05-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-06="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/06-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-07="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/07-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-08="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/08-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-09="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/09-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-10="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/10-* $JSCCOURSE_DIR_LOCAL"
	alias jsc-material-reset-11="rsync --archive --delete $JSCCOURSE_DIR_GROUP/common/material/11-* $JSCCOURSE_DIR_LOCAL"

	echo ""
	echo "*******************************************************************************"
	echo "       Welcome to the SC25 Tutorial on Multi-GPU Computing for Exascale!       "
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
