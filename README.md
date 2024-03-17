## Disclaimer
This script is provided as-is without any warranty. Use it at your own risk. The author is not responsible for any damage caused by the use or misuse of this script. Before running the script, ensure that you understand its functionality and customize it according to your specific requirements. Always review and test the script in a safe environment before deploying it to production. Additionally, make sure to comply with all applicable laws and regulations when using this script. By using this script, you agree to these terms.

## What problem is this script solving
One or more of the storechain services gets stopped from time to time and  node owners have to manualy run the official restart command to get the node  backup. This script will monitor the services  automatically and run the  restart if any of the service is not available

## How to setup
This solution uses Pm2  Api in javascript code

### Assumption
it's assumed you already have he storechain node installed and running normal and pm2 on your server runs only storechain node services. If you have a personal service not storechain, that service all also be restarted.
#### Tested on
Ubuntu 12 , Debian 12  with default storage chain setup.

### Step 1
Install  pm2 globally. This  won't conflict  with your current installation. It's needed by the  Bot. so it's  safe to run

```bash
npm install pm2 --save
```
### Step 2
Create a special folder for the bot application and restart logs.

```bash
mkdir /root/storechain_service_monitor/
```
### Step 3
At this point, we need to upload the bot.js file to  the folder  created  above 
#### if you accessing  your server via SSH, run this command 
```bash
nano  /root/storechain_service_monitor/bot.js
```
Running the above command will open a blank screen. Download the bot.js from this repository , copy the content and paste in this blank file
Enter Ctrl + x to save the file

#### If using a file upload service like Winscp , 
Login to Winscp, go to /root/storechain_service_monitor/ , create a new file called bot.js. Save

### Step 4 
Setup cronjob to automatically to the checking of service and restart

```bash
crontab -e
```
The above command will open the crontab file in your default text editor.

You might get the following response if no crontab file exists. enter 1 in the choose section to use #### nano  editor 
Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano        <---- easiest
  2. /usr/bin/vim.tiny

Choose 1-2 [1]:


Add the following line to the crontab file:
```bash
*/5 * * * * /usr/bin/node /root/storechain_service_monitor/bot.js
```
Enter ctrl + x to save the file

####  See the restart logs 
```bash
nano /root/storechain_service_monitor/restarts.log
```
At this point, your  node will run 100%  and auto restart if it turns red. You don't need to do anything. 


### That's it.
If this script helped you, please buy me a coffee  :smile:
### WSTOR (polygon chain) 0x20B2e8e0586ed98Ad128d1f24b7425347d0314d5
### Polycon:  0x20B2e8e0586ed98Ad128d1f24b7425347d0314d5
### Etheruem: 0x20B2e8e0586ed98Ad128d1f24b7425347d0314d5
