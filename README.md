## Disclaimer
This script is provided as-is without any warranty. Use it at your own risk. The author is not responsible for any damage caused by the use or misuse of this script. Before running the script, ensure that you understand its functionality and customize it according to your specific requirements. Always review and test the script in a safe environment before deploying it to production. Additionally, make sure to comply with all applicable laws and regulations when using this script. By using this script, you agree to these terms.

## What problem is this script solving
One or more of the storechain services gets stopped from time to time and  node owners have to manualy run the official restart command to get the node  backup. This script will monitor the services  automatically and run the  restart if any of the service is not available


## How to setup
This solution uses Pm2  Api in javascript code

### Assumption
it's assumed you already have the storage chain node installed and running normal and pm2 on your server runs only storechain node services. If you have a personal service not storechain, that service all also be restarted.
#### Tested on
Ubuntu 12 , Debian 12  with default storage chain setup.

## Before you begin, pay attention to the following
This script will be executed by cronjob. Cronjobs  will require absolute path for pm2. For this reason, you will need to modify the main.sh  in the following location


### Step 1
Login to your server using ssh

change directory

```bash
cd  /root
```

### Step 2
Download the monitor installer
```bash
wget https://github.com/pycodeone/storechain-monitor-bot/raw/main/storechain_monitor_installer.sh
```
### Step 3
Set installer to be executable
```bash
chmod +x  storechain_monitor_installer.sh
```

### Step 4
Run the installer

```bash
./storechain_monitor_installer.sh
```

###  Actions that will be performed
1. Downloads the installer to root director
2. Creates folder storechain_service_monitor/
3. Download the monitor bot
4. Create cronjob to check node status every 5 mins and auto restart
5. Modifies  cd /root/storagechainnode-linux/main.sh and change   pm2 to absolute path

####  See the restart logs 
```bash
nano /root/storechain_service_monitor/restarts.log
```
####  See the runner logs 
```bash
nano /root/storechain_service_monitor/runner.log
```
At this point, your  node will run 100%  and auto restart if it turns red. You don't need to do anything. 


### That's it.
If this script helped you, please buy me a coffee  :smile:
### WSTOR (polygon chain) 0x20B2e8e0586ed98Ad128d1f24b7425347d0314d5
### Polycon:  0x20B2e8e0586ed98Ad128d1f24b7425347d0314d5
### Etheruem: 0x20B2e8e0586ed98Ad128d1f24b7425347d0314d5
