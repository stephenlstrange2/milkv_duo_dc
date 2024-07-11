# milkv_duo_dc
milkv-duo vscode dev container



Clone repository and include submodules:
git clone --recurse-submodules https://github.com/boberace/milkv_duo_dc.git


The devcontainer opens up in the /home/work directory created in milkvtech/milkv-duo:latest
It mounts duo-examples and .devcontainer folder in the same director for access
It also mounts the .bash_aliases file to /root from the .devcontainer folder with is run by .bashrc

Environments are loaded on conatiner open.  First run will download duo-sdk to duo-examples

