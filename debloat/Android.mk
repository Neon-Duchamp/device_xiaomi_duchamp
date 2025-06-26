LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := debloat
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := /dev/null

# Use += for backward compatibility
LOCAL_OVERRIDES_PACKAGES += AmbientSensePrebuilt AppDirectedSMSService
LOCAL_OVERRIDES_PACKAGES += AudioFX Browser2 ConnMO DCMO
LOCAL_OVERRIDES_PACKAGES += DMService Eleven FilesPrebuilt GCS
LOCAL_OVERRIDES_PACKAGES += Gallery2 MaestroPrebuilt MicropaperPrebuilt
LOCAL_OVERRIDES_PACKAGES += MyVerizonServices OBDM_Permissions obdm_stub
LOCAL_OVERRIDES_PACKAGES += Ornament Recorder RecorderPrebuilt SafetyHubPrebuilt
LOCAL_OVERRIDES_PACKAGES += SCONE ScribePrebuilt Showcase SoundAmplifierPrebuilt
LOCAL_OVERRIDES_PACKAGES += SprintDM SprintHM SwitchAccessPrebuilt Tycho
LOCAL_OVERRIDES_PACKAGES += USCCDM VZWAPNLib VzwOmaTrigger WallpapersBReel2020

include $(BUILD_PREBUILT)
