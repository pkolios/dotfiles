#!/bin/bash

# macOS 10.12 Sierra
# Put "Keyboard Grave Accent and Tilde 0x35" on "Keyboard Non-US \ and | 0x64"
# and "Keyboard Left Shift 0xE1" on "Keyboard Grave Accent and Tilde 0x35"
hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x700000064,
      "HIDKeyboardModifierMappingDst":0x700000035},
     {"HIDKeyboardModifierMappingSrc":0x700000035,
      "HIDKeyboardModifierMappingDst":0x7000000E1}]
}'

# Persist change after restart
sudo defaults write com.apple.loginwindow LoginHook $(pwd)/remap-keys.sh
