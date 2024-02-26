#!/bin/bash

# sudo capsh --user=jonesgc --caps=CAP_SYS_NICE+eip -- -c "podman run -it --privileged --rm localhost/pycaptest /usr/local/bin/python3.10 /tmp/test.py"

# podman run -it --cap-add "sys_nice" --security-opt secomp=unconfined --rm pycaptest /usr/local/bin/python3.10 /tmp/test.py
# podman run -it --cap-add "sys_nice" --userns=host --security-opt seccomp=unconfined --rm pycaptest /usr/local/bin/python3.10 /tmp/test.py
# podman run -it --cap-add "sys_nice" --userns=host --rm pycaptest /usr/local/bin/python3.10 /tmp/test.py
# podman run -it --cap-add=sys_nice --userns=host --rm pycaptest /usr/local/bin/python3.10 /tmp/test.py
# # podman run -it --ulimit rtprio=99 --cap-add=sys_nice --userns=host --rm pycaptest /usr/local/bin/python3.10 /tmp/test.py

# podman run -it --cap-add=sys_nice --cap-add=ipc_lock --rm pycaptest /usr/local/bin/python3.10 /tmp/test.py

# podman run -it --cap-add=net_raw --rm pycaptest /usr/local/bin/python3.10 /tmp/cap_net_raw_test.py
# podman run -it --cap-add=sys_nice --cap-add=ipc_lock --rm pycaptest3 python /app/test.py
# podman run -it --privileged --rm pycaptest3 python /app/test.py


function test_netraw() {
  podman run -it --cap-add=net_raw --rm captest/capnet
}

function test_ipclock(){
  podman run -it --cap-add=ipc_lock --rm captest/ipclock
}

function test_sysnice(){
  podman run -it --cap-add=sys_nice --rm captest/sysnice
}

for line in $(find . -type d | grep -v .git)
do
  tag="captest/$(echo $line | cut --characters=3-)"
  echo "TAG: $tag"
  if [[ $tag == "captest/capnet" ]]; then
    test_netraw
  elif [[ $tag == "captest/ipclock" ]]; then
    test_ipclock
  elif [[ $tag == "captest/sysnice" ]]; then
    test_sysnice
  fi
done

