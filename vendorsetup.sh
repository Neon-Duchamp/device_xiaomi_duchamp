cd external/wpa_supplicant_8
git fetch https://github.com/Neon-Duchamp/android_external_wpa_supplicant_8
git cherry-pick 6cd84ef0cadada59a8715fe42acc56ec3f58c5c2
cd ../../

cd packages/apps/Settings
git fetch https://github.com/Neon-Duchamp/android_packages_apps_Settings
git cherry-pick 44d0726b0a0673b9a64f5ceab35e8bc146a39230 cc0b4595d153b177f4c66987c1116d22553ebfe4 a02515918c26bd0c9ebd062ae3e523ace6e62a7c
cd ../../../
