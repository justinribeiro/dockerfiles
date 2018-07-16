#!/bin/sh

# Need to start the ssh-agent so we can auth the session
eval `ssh-agent -s`

# add the key we copied to the session
ssh-add

# start the private-bower instance
private-bower --config /mirror/bowerConfig.json