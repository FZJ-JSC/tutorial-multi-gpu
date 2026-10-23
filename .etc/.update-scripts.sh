#!/usr/bin/env bash
sed -i 's/training2628/training2660/g' common-env/deploy.sh deploy-material.sh printout.tex env.sh common-env/jsccourse-bashrc.sh common-env/.set-facl-permissions.sh
sed -i 's/ISC26-Multi-GPU-Tutorial/SC26-Multi-GPU-Tutorial/g' env.sh
sed -i 's/ISC26/SC26/g' env.sh
sed -i 's/"$currentday" == "22"/"$currentday" == "15"/g' common-env/jsccourse-bashrc.sh
sed -i 's/isc26-multigpu-tut/sc26-multigpu-tut/g' common-env/jsccourse-bashrc.sh