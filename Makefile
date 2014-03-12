SHELL := /bin/bash

ifeq ($(BUILD_DIR),)
  $(error BUILD_DIR not set)
endif
ifeq ($(INSTALL_DIR),)
  $(error INSTALL_DIR not set)
endif

# Whenever package is updated, increment build_tag number to force a rebuild
build_tag=build_tag_0
src=$(abspath .)

.PHONY: all clean

all: $(BUILD_DIR)/$(build_tag)

$(BUILD_DIR)/$(build_tag):
	@rm -f $(BUILD_DIR)/build_tag*
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(INSTALL_DIR)
	@source bootstrap.sh \
	  && catkin_make_isolated \
	       --source=$(src) \
	       --build=$(BUILD_DIR) \
	       --devel=$(INSTALL_DIR) \
	       --merge \
	       --only-pkg-with-deps catkin catkin_simple \
	       --cmake-args -DBUILD_SHARED_LIBS=ON \
	                    -DCMAKE_MODULE_PATH="$(CMAKE_MODULE_PATH)"
	@cp -r $(abspath catkin_pkg/src/catkin_pkg) $(abspath $(INSTALL_DIR))/lib/python2.7/dist-packages
	@cp $(abspath catkin_pkg/bin)/* $(abspath $(INSTALL_DIR))/bin
	@/bin/echo -e "\e[0;34m===== Copied catkin_pkg lib and scripts to $(INSTALL_DIR) =====\e[0m"
	@touch $(BUILD_DIR)/$(build_tag)

clean:
	@rm -rf $(BUILD_DIR)
	@rm -rf $(INSTALL_DIR)
	@rm -f $(BUILD_DIR)/build_tag*

