#!/bin/bash



_base=/opt/openbaton
_ems_base="${_base}/ems"
_ems_config_file=/etc/opnbaton/ems/conf.ini

function start {
  sudo python $_ems_base
}

function stop {
   sudo kill $(ps aux | grep 'python\ $_ems_base/src' | awk '{print $2}')
}

function kill {
    sudo kill $(ps aux | grep 'python\ $_ems_base/src' | awk '{print $2}')
}

function end {
    sudo kill $(ps aux | grep 'python\ $_ems_base/src' | awk '{print $2}')
}
function usage {
    echo -e "EMS\n"
    echo -e "Usage:\n\t ./ems.sh <option>\n\t"
    echo -e "where option is"
    echo -e "\t\t * start"
    echo -e "\t\t * stop"
    echo -e "\t\t * kill"
}



if [ $# -eq 0 ]
   then
        usage
        exit 1
fi

declare -a cmds=($@)
for (( i = 0; i <  ${#cmds[*]}; ++ i ))
do
    case ${cmds[$i]} in
        "start" )
            start ;;
        "stop" )
            stop ;;
        "kill" )
            kill ;;
        * )
            usage
            end ;;
    esac
done
