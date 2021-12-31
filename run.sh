#!/bin/zsh

xcodebuild \
    test \
    -scheme XCTestCrash \
    -destination "platform=iOS Simulator,name=iPhone 8 Plus,OS=latest"
