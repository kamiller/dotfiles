# Users #
-----------

## sudo ##

    /usr/sbin/groupadd wheel

### /usr/sbin/visudo ###

    ## Allows people in group wheel to run all commands
    %wheel  ALL=(ALL)       ALL
    #%wheel ALL=(ALL) NOPASSWD: ALL

### users ###

    /usr/sbin/adduser ${USER}
    /usr/sbin/usermod -a -G wheel ${USER}

## SSH ##

### Local ###

    mkdir ~/.ssh
    ssh-keygen -t rsa
    scp ~/.ssh/id_rsa.pub ${USER}@${HOSTNAME}:

### Remote ###

    mkdir ~${USER}/.ssh
    mv ~${USER}/id_rsa.pub ~${USER}/.ssh/authorized_keys

    chown -R ${USER}:${USER} ~${USER}/.ssh
    chmod 700 ~${USER}/.ssh
    chmod 600 ~${USER}/.ssh/authorized_keys

### /etc/ssh/sshd_config ###

    Port 22                      #change to non-standard port
    Protocol 2
    PermitRootLogin no
    PasswordAuthentication yes   #change to no
    UseDNS no
    #AllowUsers ${USER}          #specify individual users for higher security


    
