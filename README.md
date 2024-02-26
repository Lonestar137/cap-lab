

# Capabilities

Capabilities can be set on an executable file to allow certain admin permissions for the process.

i.e.
```bash
sudo setcap cap_net_raw,cap_sys_nice=eip /usr/bin/podman 
```
