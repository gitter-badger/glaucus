#!/bin/dash -ex
cd /home/glaucus
git config --global user.name "Firas Khalil Khana"
git config --global user.email "firasuke@gmail.com"
mkdir -pv \
        logs/system \
        logs/toolchain \
        play \
        system \
        temporary/system/builds \
        temporary/system/cerata \
        temporary/system/sources \
        temporary/toolchain/builds \
        toolchain
