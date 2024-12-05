FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

FILESEXTRAPATHS:prepend:zynqmp-generic := "${THISDIR}/${PN}/zynqmp:"
FILESEXTRAPATHS:prepend:zynq-generic := "${THISDIR}/${PN}/zynq:"

ENCLUSTRA_BOOTMODE := "sd"
ENCLUSTRA_BOOTMODE:enclustra-qspi := "qspi"
ENCLUSTRA_BOOTMODE:enclustra-emmc := "emmc"

FILESEXTRAPATHS:prepend:zynqmp-generic := "${THISDIR}/${PN}/zynqmp/${ENCLUSTRA_BOOTMODE}:"
FILESEXTRAPATHS:prepend:zynq-generic := "${THISDIR}/${PN}/zynq/${ENCLUSTRA_BOOTMODE}:"

SRC_URI:append = " file://0010-RTL8211F.patch"
SRC_URI:append = " file://0001-RTC.patch"

## (debugging) mark recipe as development version
#DEFAULT_PREFERENCE = "-1"

SRC_URI:append = " file://bsp.cfg"
KERNEL_FEATURES:append = " bsp.cfg"

SRC_URI:append = " file://kernel.cfg"
KERNEL_FEATURES:append = " kernel.cfg"

SRC_URI:append:xu61-module:enclustra-qspi = " file://limit_cma.cfg"
KERNEL_FEATURES:append:xu61-module:enclustra-qspi = " limit_cma.cfg"

## excludes this kernel explicitely from other MACHINE build targets
COMPATIBLE_MACHINE = "(zynq-generic|zynqmp-generic)"
