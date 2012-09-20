LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),mint)
    include $(call first-makefiles-under,$(LOCAL_PATH))
endif
