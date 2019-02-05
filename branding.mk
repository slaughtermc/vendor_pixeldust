# Set all versions
CUSTOM_BUILD_TYPE ?= UNOFFICIAL
CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
CUSTOM_PLATFORM_VERSION := 9.0

TARGET_PRODUCT_SHORT := $(subst citrus_,,$(CUSTOM_BUILD))

ifeq ($(IS_GO_VERSION), true)
CUSTOM_VERSION := citrus_go_$(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
ROM_FINGERPRINT := citrus_go/$(CUSTOM_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)
else
CUSTOM_VERSION := citrus_$(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
ROM_FINGERPRINT := citrus/$(CUSTOM_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)
endif

CUSTOM_PROPERTIES := \
    org.citrus.version=$(CUSTOM_VERSION) \
    org.citrus.build_date=$(CUSTOM_BUILD_DATE) \
    org.citrus.build_type=$(CUSTOM_BUILD_TYPE) \
    org.citrus.fingerprint=$(ROM_FINGERPRINT)
