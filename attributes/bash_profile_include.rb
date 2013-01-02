node.override["bash_includes_subdir"]="/etc/bash.d"
if node["platform"] == "ubuntu"
    node.override["bash_bashrc"]="/etc/bash.bashrc"
else
    node.override["bash_bashrc"]="/etc/bashrc"
end
