#!/bin/bash

# Install pm2 globally
echo "Installing pm2..."
npm install pm2 --save

# Create directory
echo "Creating directory /root/storechain_service_monitor/..."
mkdir -p /root/storechain_service_monitor/

# Download bot.js from GitHub
echo "Downloading bot.js from GitHub..."
wget -O /root/storechain_service_monitor/bot.js https://github.com/pycodeone/storechain-monitor-bot/raw/main/bot.js

# Check if cron job already exists
cron_job="*/5 * * * * /usr/bin/node /root/storechain_service_monitor/bot.js >> /root/storechain_service_monitor/runner.log"
if ! crontab -l | grep -qF "$cron_job"; then
    # Add cron job
    echo "Adding cron job..."
    (crontab -l ; echo "$cron_job") | crontab -
fi

# Set nano as default editor for crontab
export VISUAL=nano
export EDITOR=nano


# Modify lines in main.sh
main_sh="/root/storagechainnode-linux/main.sh"

# Check if main.sh exists

if [[ -f "$main_sh" ]]; then
    echo "Modifying $main_sh..."

    # Check if line already exists before making changes
    if ! grep -q "/usr/local/bin/pm2 flush all" "$main_sh"; then
        sed -i 's#pm2 flush all#/usr/local/bin/pm2 flush all#g' "$main_sh"
        echo "Line '/usr/local/bin/pm2 flush all' added."
    fi

    if ! grep -q "/usr/local/bin/pm2 start ./service-runner.json" "$main_sh"; then
        sed -i 's#pm2 start ./service-runner.json#/usr/local/bin/pm2 start ./service-runner.json#g' "$main_sh"
        echo "Line '/usr/local/bin/pm2 start ./service-runner.json' added."
    fi

    echo "Modification complete."
else
    echo "Error: $main_sh does not exist."
    exit 1
fi

echo "Setup complete."
