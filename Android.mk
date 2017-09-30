#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

ifeq ($(USES_DEVICE_GOOGLE_B4S4),true)
  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

  RFS_MSM_MPSS_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/mpss/
  $(RFS_MSM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	  @echo "RFS MSM MPSS links: $@"
	  $(hide) ln -sf /data/vendor/rfs/mpss $@/readwrite
	  @mkdir -p $(dir $@)/readonly/firmware/image/
	  $(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	  $(hide) ln -sf /vendor/firmware/wlanmdsp.mbn  $@/readonly/firmware/image/wlanmdsp.mbn

  ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MSM_MPSS_SYMLINKS)

endif
