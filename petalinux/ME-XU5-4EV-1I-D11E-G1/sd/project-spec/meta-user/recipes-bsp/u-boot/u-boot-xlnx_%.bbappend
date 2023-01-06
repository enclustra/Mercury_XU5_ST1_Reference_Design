FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://0001-ubifs-distroboot-support.patch file://0008-Enclustra-MAC-address-readout-from-EEPROM.patch file://0010-Enclustra-Zynqmp-Board-Patch.patch file://0012-Bugfix-for-atsha204a-driver.patch file://0020-Enclustra-ds28-eeprom-fix.patch file://0030-zynq-qspi.patch file://0040-emmc.patch file://0050-Xilinx-PHY.patch file://0060-env-qspi-boot-avoid-ubifs.patch"

SRC_URI:append = " file://platform-top.h file://bsp.cfg"
SRC_URI:append = " file://u-boot.cfg"

do_configure:append () {
	install ${WORKDIR}/platform-top.h ${S}/include/configs/
}

do_configure:append:microblaze () {
	if [ "${U_BOOT_AUTO_CONFIG}" = "1" ]; then
		install ${WORKDIR}/platform-auto.h ${S}/include/configs/
		install -d ${B}/source/board/xilinx/microblaze-generic/
		install ${WORKDIR}/config.mk ${B}/source/board/xilinx/microblaze-generic/
	fi
}
