FILESEXTRAPATHS:prepend := "${THISDIR}/files/common:"

FILESEXTRAPATHS:prepend:zynqmp-generic := "${THISDIR}/files/zynqmp:"
FILESEXTRAPATHS:prepend:zynq-generic := "${THISDIR}/files/zynq:"

ENCLUSTRA_BOOTMODE := "sd"
ENCLUSTRA_BOOTMODE:enclustra-qspi := "qspi"
ENCLUSTRA_BOOTMODE:enclustra-emmc := "emmc"

FILESEXTRAPATHS:prepend:zynqmp-generic := "${THISDIR}/files/zynqmp/${ENCLUSTRA_BOOTMODE}:"
FILESEXTRAPATHS:prepend:zynq-generic := "${THISDIR}/files/zynq/${ENCLUSTRA_BOOTMODE}:"

## common
SRC_URI:append = " file://0008-Enclustra-MAC-address-readout-from-EEPROM.patch"
SRC_URI:append = " file://0012-Atsha204a-upstream-fixes.patch"
SRC_URI:append = " file://0020-Enclustra-ds28-eeprom-fix.patch"
SRC_URI:append = " file://0030-zynq-qspi.patch"
SRC_URI:append = " file://0040-emmc.patch"
SRC_URI:append = " file://u-boot.cfg"

## specific
SRC_URI:append:zynqmp-generic = " file://0010-Enclustra-Zynqmp-Board-Patch.patch"
SRC_URI:append:zynqmp-generic = " file://sf_default_speed_50mhz.cfg"
SRC_URI:remove:xu61-module = " file://sf_default_speed_50mhz.cfg"
SRC_URI:append:xu61-module = " file://sf_default_speed_40mhz.cfg"
SRC_URI:append:zynq-generic = " file://0010-Enclustra-Zynq-Board-Patch.patch"
SRC_URI:append:zynq-generic = " file://0011-Fix-zynq_qspi_fill_tx_fifo.patch"
SRC_URI:append:zynq-generic = " file://sf_default_speed_50mhz.cfg"
SRC_URI:append:zx1-module = " file://u-boot-nand.cfg"
SRC_URI:append:zx3-module = " file://u-boot-nand.cfg"
SRC_URI:append:zx5-module = " file://u-boot-nand.cfg"
