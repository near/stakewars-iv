#!/bin/bash

# Exit script on first error, treat unset variables as an error, print each command, and return the exit status of the last non-zero command
set -euox pipefail

# Set nearcore repository and Statelessnet branch we're tracking
REPO_NAME="nearcore"
REPO="https://github.com/near/$REPO_NAME.git"
BRANCH="statelessnet_latest"
NEARD_PATH="$HOME/neard"

# Clone the repository if it doesn't exist
if [ ! -d $REPO_NAME ]; then
    echo "Cloning $REPO into $REPO_NAME"
    git clone $REPO
    cd $REPO_NAME
    git checkout $BRANCH
fi

cd $REPO_NAME
git fetch

# Check if there are any new commits
if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]; then
    echo "New commit detected. Building..."
    # Pull the latest code
    git pull origin $BRANCH

    # Trigger the build
    cargo build -p neard --bin neard --release --features statelessnet_protocol

    echo "Replacing currently running neard with new binary"
    # Move the binary and make it executable
    mv target/release/neard $NEARD_PATH
    chmod +x $NEARD_PATH

    # Restart neard service
    sudo systemctl restart neard

    echo "Neard binary was updated"
else
    echo "No new commit detected."
fi
