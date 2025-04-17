This is a [cloud-control](https://github.com/dodevops/cloudcontrol/pkgs/container/cloudcontrol-azure) machine used to operate an OpenShift cluster deployed in Azure

It has the following tools on top of cloudcontrol defaults:
az, oc, tkn

How to use:
    * COPY this folder outside of this GIT repo (use this folder as a template)
    * setup the params within docker-compose as per comments
    * execute the scripts in sequence
        # build.sh
        # init.sh
        # run.sh