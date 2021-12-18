#!/bin/bash

# Download Swift

if [[ ! -d /swift/toolchain ]]
then
    if [[ ! -d /swift ]]
    then
        mkdir /swift
    fi
    cd /swift
    curl https://download.swift.org/swift-5.5.2-release/ubuntu1804/swift-5.5.2-RELEASE/swift-5.5.2-RELEASE-ubuntu18.04.tar.gz \
        --output toolchain-tar
    
    tar -xvzf toolchain-tar -C /swift
    rm toolchain-tar
    mv swift-5.5.2-RELEASE-ubuntu18.04 toolchain
fi

# Create directory for package

if [[ ! -d /projects/Hello ]]
then
    if [[ ! -d /projects ]]
    then
        mkdir /projects
    fi
    cd /projects
    mkdir /Hello
fi
cd /projects/Hello

# Test that Swift can compile

export PATH="/swift/toolchain/usr/bin:$PATH"

if [[ ! -e Package.swift ]]
then
    swift package init
fi
swift build
