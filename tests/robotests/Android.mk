#############################################
# Car Settings Robolectric test target. #
#############################################
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := CarSettingsRoboTests

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_JAVA_RESOURCE_DIRS := config

# Include the testing libraries
LOCAL_JAVA_LIBRARIES := \
    android.car \
    android.car.user \
    robolectric_android-all-stub \
    Robolectric_all-target \
    mockito-robolectric-prebuilt \
    testng \
    truth-prebuilt

LOCAL_INSTRUMENTATION_FOR := CarSettingsForTesting

LOCAL_MODULE_TAGS := optional

include $(BUILD_STATIC_JAVA_LIBRARY)

#############################################################
# Car Settings runner target to run the previous target. #
#############################################################
include $(CLEAR_VARS)

LOCAL_MODULE := RunCarSettingsRoboTests

LOCAL_JAVA_LIBRARIES := \
    android.car \
    android.car.user \
    CarSettingsRoboTests \
    robolectric_android-all-stub \
    Robolectric_all-target \
    mockito-robolectric-prebuilt \
    testng \
    truth-prebuilt

LOCAL_TEST_PACKAGE := CarSettingsForTesting

LOCAL_INSTRUMENT_SOURCE_DIRS := $(dir $(LOCAL_PATH))../src

include external/robolectric-shadows/run_robotests.mk
