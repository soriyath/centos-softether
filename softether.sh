#!/bin/sh

# Starting SoftEther vpnserver and redirecting both sdout and sderr to docker's sdout
vpnserver start &1>> /proc/1/fd/1 &2>>/proc/1/fd/1

# Starting vpncmd and feeding options the check the program status
vpncmd <<< $'3\ncheck\n' > /proc/1/fd/1 &2>>/proc/1/fd/1
