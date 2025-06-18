cd hardware/lineage/compat
git fetch https://github.com/xiaomi-mt6897-duchamp/android_hardware_lineage_compat
git cherry-pick 9a046ea7e5899adc38ab04fe24eb34859fe4d779
cd ../../../

cd external/wpa_supplicant_8
git fetch https://github.com/xiaomi-mt6897-duchamp/android_external_wpa_supplicant_8
git cherry-pick cc88629c6c5c2c2353bf87efef9b5c9c5bf32bee
cd ../../
