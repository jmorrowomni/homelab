# remove the IP from known_hosts
ssh-keygen -f ~/.ssh/known_hosts -R $1 2>&1

# add it back
ssh-keyscan -H $1 >> ~/.ssh/known_hosts