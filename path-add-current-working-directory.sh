source ~/.profile

path=$PWD

# check if $1 is a vaild directory
if [ ! -d "$path" ]
then
    echo "$path is not a valid directory" >&2
    exit 1    
fi

# check if $path is already in PATH
if [[ ":$PATH:" == *":$path:"* ]]
then
    echo "$path is already in PATH" >&2
    exit 1
fi

# add $path to PATH
echo "export PATH=$PATH:$path" >> ~/.profile