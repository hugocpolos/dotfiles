function docker_exec()
{
    docker exec -it $(docker ps --format name=${1} -q) bash || docker exec -it $(docker ps --format name=${1} -q) sh
}

function pystyle()
{
    autopep8 --global-config /home/$USER/.pycodestyle --max-line-length 100 -i "${1}"
}

