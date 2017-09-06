#!/bin/bash

# macOS 10.12 Sierra
# Remove all custom key mapping
hidutil property --set '{"UserKeyMapping": []}'

# Remove login hook
sudo defaults delete com.apple.loginwindow LoginHook
