#!/bin/bash
#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=dipper
export DEVICE_COMMON=sdm845-common
export VENDOR=xiaomi

export DEVICE_BRINGUP_YEAR=2018

# Load com.vidhance.node.eis shim
VIDHANCE_EIS="$BLOB_ROOT"/vendor/lib/camera/component/com.vidhance.node.eis.so
patchelf --add-needed com.vidhance.node.eis.shim.so "$VIDHANCE_EIS"

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
