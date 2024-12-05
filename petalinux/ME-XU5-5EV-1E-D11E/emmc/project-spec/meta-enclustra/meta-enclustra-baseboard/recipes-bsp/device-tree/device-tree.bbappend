FILESEXTRAPATHS:prepend := "${THISDIR}/files/common:"

FILESEXTRAPATHS:prepend:refdes-xu1-pe1 := "${THISDIR}/files/refdes-xu1-pe1:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu1-pe3 := "${THISDIR}/files/refdes-xu1-pe3:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu1-st1 := "${THISDIR}/files/refdes-xu1-st1:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-xu3-st3 := "${THISDIR}/files/refdes-xu3-st3:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-xu5-pe1 := "${THISDIR}/files/refdes-xu5-pe1:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu5-pe3 := "${THISDIR}/files/refdes-xu5-pe3:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu5-st1 := "${THISDIR}/files/refdes-xu5-st1:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-xu6-pe1 := "${THISDIR}/files/refdes-xu6-pe1:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu6-pe3 := "${THISDIR}/files/refdes-xu6-pe3:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu6-st1 := "${THISDIR}/files/refdes-xu6-st1:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-xu61-pe1 := "${THISDIR}/files/refdes-xu61-pe1:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu61-pe3 := "${THISDIR}/files/refdes-xu61-pe3:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu61-st1 := "${THISDIR}/files/refdes-xu61-st1:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-xu7-pe1 := "${THISDIR}/files/refdes-xu7-pe1:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu7-pe3 := "${THISDIR}/files/refdes-xu7-pe3:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu7-st1 := "${THISDIR}/files/refdes-xu7-st1:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-xu8-pe1 := "${THISDIR}/files/refdes-xu8-pe1:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu8-pe3 := "${THISDIR}/files/refdes-xu8-pe3:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu8-st1 := "${THISDIR}/files/refdes-xu8-st1:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-xu9-pe1 := "${THISDIR}/files/refdes-xu9-pe1:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu9-pe3 := "${THISDIR}/files/refdes-xu9-pe3:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-xu9-st1 := "${THISDIR}/files/refdes-xu9-st1:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-zx1-pe1 := "${THISDIR}/files/refdes-zx1-pe1:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-zx1-pe3 := "${THISDIR}/files/refdes-zx1-pe3:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-zx1-st1 := "${THISDIR}/files/refdes-zx1-st1:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-zx2-st3 := "${THISDIR}/files/refdes-zx2-st3:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-zx3-st3 := "${THISDIR}/files/refdes-zx3-st3:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-zx5-pe1 := "${THISDIR}/files/refdes-zx5-pe1:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-zx5-pe3 := "${THISDIR}/files/refdes-zx5-pe3:${SYSCONFIG_PATH}:"
FILESEXTRAPATHS:prepend:refdes-zx5-st1 := "${THISDIR}/files/refdes-zx5-st1:${SYSCONFIG_PATH}:"

FILESEXTRAPATHS:prepend:refdes-xzu65-st1 := "${THISDIR}/files/refdes-xzu65-st1:${SYSCONFIG_PATH}:"

ENCLUSTRA_SELECT_ARCH := "zynq"
ENCLUSTRA_SELECT_ARCH:zynqmp-generic := "zynqmp"

SRC_URI:append = " file://system-user.dtsi"

## enclustra st1 dtsi
SRC_URI:append:pe1-generic = " file://${ENCLUSTRA_SELECT_ARCH}_enclustra_mercury_pe1.dtsi"
SRC_URI:append:pe3-generic = " file://${ENCLUSTRA_SELECT_ARCH}_enclustra_mercury_pe3.dtsi"
SRC_URI:append:st1-generic = " file://${ENCLUSTRA_SELECT_ARCH}_enclustra_mercury_st1.dtsi"
SRC_URI:append:st3-generic = " file://${ENCLUSTRA_SELECT_ARCH}_enclustra_mars_st3.dtsi"

## fix DT flags for petalinux tool
## NB: required with explicit override ONLY!
YAML_DT_BOARD_FLAGS:refdes-xu1-pe1 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu1-pe3 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu1-st1 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-xu3-st3 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-xu5-pe1 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu5-pe3 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu5-st1 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-xu6-pe1 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu6-pe3 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu6-st1 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-xu61-pe1 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu61-pe3 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu61-st1 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-xu7-pe1 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu7-pe3 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu7-st1 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-xu8-pe1 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu8-pe3 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu8-st1 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-xu9-pe1 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu9-pe3 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-xu9-st1 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-zx1-pe1 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-zx1-pe3 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-zx1-st1 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-zx2-st3 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-zx3-st3 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-zx5-pe1 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-zx5-pe3 = "{BOARD template}"
YAML_DT_BOARD_FLAGS:refdes-zx5-st1 = "{BOARD template}"

YAML_DT_BOARD_FLAGS:refdes-xzu65-st1 = "{BOARD template}"

PROC_TUNE = "${@'cortexa53' if d.getVar('SYSTEM_DTFILE') != '' else ''}"
