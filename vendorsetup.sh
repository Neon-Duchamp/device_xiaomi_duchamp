#!/bin/bash

# Set up Clang environment (must be outside subshell to persist)
export CLANG_PATH=$PWD/prebuilts/clang/host/linux-x86/clang-r547379/bin
export PATH=$CLANG_PATH:$PATH
export CC=$CLANG_PATH/clang
export CXX=$CLANG_PATH/clang++
export LD=$CLANG_PATH/ld.lld
alias clang=$CLANG_PATH/clang
alias clang++=$CLANG_PATH/clang++
alias ld.lld=$CLANG_PATH/ld.lld

echo "Clang environment configured."

# Fix color mode service in gaming macro
(
  cd packages/apps/Settings || exit

  if ! git log --oneline | grep -q 30dea3a89a79318a951c6c67271de54739427b65; then
    echo "Applying custom patch to Settings..."
    git fetch https://github.com/Neon-Duchamp/yaap_packages_apps_Settings fifteen
    git cherry-pick 30dea3a89a79318a951c6c67271de54739427b65
  else
    echo "Patch already applied."
  fi
)

# Refresh signing keys in proper format
(
  if [ -d vendor/yaap/signing/keys ]; then
    echo "Removing existing signing keys..."
    rm -rf vendor/yaap/signing/keys
  fi

  echo "Cloning fresh signing keys..."
  git clone https://github.com/Neon-Duchamp/keys.git -b yaap-keys vendor/yaap/signing/keys
)

# Apply microg new update by picking on 'sixteen' branch
(
  cd vendor/microg || exit

  if ! git log --oneline | grep -q a216523a74f6b90f885420d389554678e1948715; then
    echo "Applying microG patch from 'sixteen' branch..."
    git fetch https://github.com/yaap/vendor_microg sixteen
    git cherry-pick a216523a74f6b90f885420d389554678e1948715
  else
    echo "microG patch already applied."
  fi
)
