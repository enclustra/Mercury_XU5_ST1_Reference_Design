FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:zynq-generic = " file://zynq_enclustra_common.dtsi"
SRC_URI:append:zynqmp-generic = " file://zynqmp_enclustra_common.dtsi"

SRC_URI:append:zx2-module = " file://zynq_enclustra_mars_zx2.dtsi"
SRC_URI:append:zx3-module = " file://zynq_enclustra_mars_zx3.dtsi file://zynq_enclustra_nand_parts.dtsi"
SRC_URI:append:zx1-module = " file://zynq_enclustra_mercury_zx1.dtsi file://zynq_enclustra_nand_parts.dtsi"
SRC_URI:append:zx5-module = " file://zynq_enclustra_mercury_zx5.dtsi file://zynq_enclustra_nand_parts.dtsi"

SRC_URI:append:xu3-module = " file://zynqmp_enclustra_mars_xu3.dtsi"
SRC_URI:append:xu1-module = " file://zynqmp_enclustra_mercury_xu1.dtsi"
SRC_URI:append:xu5-module = " file://zynqmp_enclustra_mercury_xu5.dtsi"
SRC_URI:append:xu6-module = " file://zynqmp_enclustra_mercury_xu6.dtsi"
SRC_URI:append:xu61-module = " file://zynqmp_enclustra_mercury_xu61.dtsi"
SRC_URI:append:xu7-module = " file://zynqmp_enclustra_mercury_xu7.dtsi"
SRC_URI:append:xu8-module = " file://zynqmp_enclustra_mercury_xu8.dtsi"
SRC_URI:append:xu9-module = " file://zynqmp_enclustra_mercury_xu9.dtsi"

SRC_URI:append:xzu65-module = " file://zynqmp_enclustra_andromeda_xzu65.dtsi"

## NOTE: find the following appended in meta-user
#SRC_URI:append = " file://config"
#SRC_URI:append = " file://system-user.dtsi"
