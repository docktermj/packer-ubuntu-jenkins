# Configure Jenkins


1. Visit http://nn.nn.nn.nn:8080
1. On Jenkins server, find administrator password.

   ```console
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```
1. Click "Install suggested plugins"
1. In "Create First Admin User" dialog
   1. **Username:** jenkins
   1. **Password:** passw0rd


## Add node

1. Jenkins > Manage Jenkins > Manage Nodes > New Node
   1. In "Jenkins > New Node" dialog:
      1. **Node name:** CentOS NN
      1. :radio_button: Permanent Agent
      1. Click "OK" button
   1. In "Configure" dialog: 
      1. **Remote rood directory:** /home/jenkins
      1. **Launch method:** Launch slave agents via SSH
         1. **Host:**  IP address / hostname of slave
         1. **Credentials:**   Click "Add > Jenkins"
            1. In "Jenkins Credentials Provider: Jenkins" dialog"
               1. **Kind:**  Username with password
               1. **Username:** jenkins
               1. **Password:** jenkins
               1. Click "Add" button
            1. In drop-down, choose "jenkins/******"
         1. **Host Key Verification Strategy:** Non verifying Verification Strategy
            1. **Note:** this is not secure, but it works until we figure out how to use a different option.
      1. Click "Save" button.
