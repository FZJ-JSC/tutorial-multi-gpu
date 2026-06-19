#!/usr/bin/env bash
sed -i 's/training2555/training2628/g' common-env/deploy.sh deploy-material.sh printout.tex env.sh common-env/jsccourse-bashrc.sh common-env/.set-facl-permissions.sh
sed -i 's/SC25-Multi-GPU-Tutorial/ISC26-Multi-GPU-Tutorial/g' env.sh
sed -i 's/SC25/ISC26/g' env.sh
sed -i 's/"$currentday" == "16"/"$currentday" == "22"/g' common-env/jsccourse-bashrc.sh
sed -i 's/sc25-multigpu-tut/isc26-multigpu-tut/g' common-env/jsccourse-bashrc.sh