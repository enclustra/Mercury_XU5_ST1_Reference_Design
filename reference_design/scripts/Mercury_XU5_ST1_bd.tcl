# ----------------------------------------------------------------------------------------------------
# Copyright (c) 2024 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------------------------

create_bd_design $module


create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e zynq_ultra_ps_e
set_property -dict [ list \
  CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS18} \
  CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS18} \
  CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS18} \
  CONFIG.PSU_BANK_3_IO_STANDARD {LVCMOS18} \
] [get_bd_cells zynq_ultra_ps_e]
set_property -dict [ list \
  CONFIG.PSU__DISPLAYPORT__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__DP__REF_CLK_SEL {Ref Clk3} \
  CONFIG.PSU__DP__LANE_SEL {Dual Lower} \
  CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__SRCSEL {DPLL} \
  CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__SRCSEL {VPLL} \
  CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {DPLL} \
  CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {DPLL} \
] [get_bd_cells zynq_ultra_ps_e]
set_property -dict [ list \
  CONFIG.PSU__SD1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__SD1__SLOT_TYPE {SD 2.0} \
  CONFIG.PSU__SD1__PERIPHERAL__IO {MIO 46 .. 51} \
  CONFIG.PSU__SD1__GRP_CD__ENABLE {1} \
  CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__I2C0__PERIPHERAL__IO {MIO 10 .. 11} \
  CONFIG.PSU__UART0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__UART0__PERIPHERAL__IO {MIO 38 .. 39} \
  CONFIG.PSU__TTC0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__FPGA_PL1_ENABLE {1} \
  CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {50} \
  CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__GPIO2_MIO__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU_MIO_12_PULLUPDOWN {disable} \
] [get_bd_cells zynq_ultra_ps_e]

if { $PS_DDR_TYPE == "PS_D10H"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {4096 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {15} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Disabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {32 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR_TYPE == "PS_D10EH"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {4096 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {15} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Enabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {32 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR_TYPE == "PS_D11E"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {4096 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {15} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Enabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR_TYPE == "PS_D12E"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {8192 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {16} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Enabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR_TYPE == "PS_D12"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {8192 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {16} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Disabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR_TYPE == "PS_D13E"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {16384 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {17} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Enabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PL_ETH == "PL_ETH"} {
  set_property -dict [ list \
    CONFIG.PSU__ENET1__PERIPHERAL__ENABLE {1} \
    CONFIG.PSU__ENET1__PERIPHERAL__IO {EMIO} \
    CONFIG.PSU__ENET1__GRP_MDIO__ENABLE {1} \
    CONFIG.PSU__ENET1__GRP_MDIO__IO {EMIO} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_ETH == "PS_ETH"} {
  set_property -dict [ list \
    CONFIG.PSU__ENET0__GRP_MDIO__ENABLE {1} \
    CONFIG.PSU__ENET0__PERIPHERAL__ENABLE {1} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_USB0 == "PS_USB0"} {
  set_property -dict [ list \
    CONFIG.PSU__USB0__PERIPHERAL__ENABLE {1} \
    CONFIG.PSU__USB__RESET__MODE {Disable} \
    CONFIG.PSU__USB0__REF_CLK_SEL {Ref Clk2} \
    CONFIG.PSU__USB0__REF_CLK_FREQ {100} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_USB1 == "PS_USB1"} {
  set_property -dict [ list \
    CONFIG.PSU__USB1__PERIPHERAL__ENABLE {1} \
    CONFIG.PSU__USB__RESET__MODE {Disable} \
    CONFIG.PSU__USB1__REF_CLK_SEL {Ref Clk2} \
    CONFIG.PSU__USB1__REF_CLK_FREQ {100} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_EMMC == "PS_EMMC"} {
  set_property -dict [ list \
    CONFIG.PSU__SD0__PERIPHERAL__ENABLE {1} \
    CONFIG.PSU__SD0__SLOT_TYPE {eMMC} \
    CONFIG.PSU__SD0__PERIPHERAL__IO {MIO 13 .. 22} \
    CONFIG.PSU__SD0__DATA_TRANSFER_MODE {8bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_QSPI == "PS_QSPI"} {
  set_property -dict [ list \
    CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1} \
    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__FREQMHZ {200} \
    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__SRCSEL {RPLL} \
    CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {1} \
    CONFIG.PSU__QSPI__PERIPHERAL__DATA_MODE {x4} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

create_bd_cell -type ip -vlnv xilinx.com:ip:system_management_wiz system_management_wiz
set_property -dict [ list \
  CONFIG.TEMPERATURE_ALARM_OT_TRIGGER {85} \
  CONFIG.CHANNEL_ENABLE_VP_VN {false} \
] [get_bd_cells system_management_wiz]
set_property -dict [ list \
  CONFIG.PSU_MIO_13_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_14_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_15_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_16_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_17_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_18_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_19_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_20_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_21_PULLUPDOWN {disable} \
  CONFIG.PSU__SD0__PERIPHERAL__IO {MIO 13 .. 22} \
  CONFIG.PSU__SD0__DATA_TRANSFER_MODE {8Bit} \
  CONFIG.PSU__USE__IRQ0  {1} \
] [get_bd_cells zynq_ultra_ps_e]
set_property -dict [ list \
  CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__I2C1__PERIPHERAL__IO {EMIO} \
] [get_bd_cells zynq_ultra_ps_e]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio led
set_property -dict [ list \
  CONFIG.C_GPIO_WIDTH {2} \
  CONFIG.C_ALL_OUTPUTS {1} \
  CONFIG.C_DOUT_DEFAULT {0x00000003} \
] [get_bd_cells led]

if { $PL_DDR == "PL_DDR"} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4 ddr4
}

if { $PL_DDR == "PL_DDR"} {
  set_property -dict [ list \
    CONFIG.PSU__USE__M_AXI_GP0 {1} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PL_DDR == "No_PL_DDR"} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf util_ds_buf_0
  set_property -dict [ list \
    CONFIG.C_BUF_TYPE {OBUFDS} \
  ] [get_bd_cells util_ds_buf_0]
}

if { $PL_DDR == "No_PL_DDR"} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant xlconstant_0
}

if { $PL_DDR_TYPE == "512MB_1066MHz"} {
  set_property -dict [ list \
    CONFIG.C0.DDR4_TimePeriod {938} \
    CONFIG.C0.DDR4_InputClockPeriod {10006} \
    CONFIG.C0.DDR4_MemoryPart {MT40A256M16GE-083E} \
    CONFIG.C0.DDR4_DataWidth {16} \
    CONFIG.C0.DDR4_CasLatency {16} \
    CONFIG.C0.DDR4_CasWriteLatency {11} \
  ] [get_bd_cells ddr4]
}

if { $PL_DDR_TYPE == "512MB_1200MHz"} {
  set_property -dict [ list \
    CONFIG.C0.DDR4_TimePeriod {833} \
    CONFIG.C0.DDR4_InputClockPeriod {9996} \
    CONFIG.C0.DDR4_MemoryPart {MT40A256M16GE-083E} \
    CONFIG.C0.DDR4_DataWidth {16} \
    CONFIG.C0.DDR4_CasLatency {17} \
    CONFIG.C0.DDR4_CasWriteLatency {12} \
  ] [get_bd_cells ddr4]
}

if { $PL_DDR_TYPE == "1GB_1066MHz"} {
  set_property -dict [ list \
    CONFIG.C0.DDR4_TimePeriod {938} \
    CONFIG.C0.DDR4_InputClockPeriod {10006} \
    CONFIG.C0.DDR4_MemoryPart {MT40A512M16HA-083E} \
    CONFIG.C0.DDR4_DataWidth {16} \
    CONFIG.C0.DDR4_CasLatency {16} \
    CONFIG.C0.DDR4_CasWriteLatency {11} \
  ] [get_bd_cells ddr4]
}

if { $PL_DDR_TYPE == "1GB_1200MHz"} {
  set_property -dict [ list \
    CONFIG.C0.DDR4_TimePeriod {833} \
    CONFIG.C0.DDR4_InputClockPeriod {9996} \
    CONFIG.C0.DDR4_MemoryPart {MT40A512M16HA-083E} \
    CONFIG.C0.DDR4_DataWidth {16} \
    CONFIG.C0.DDR4_CasLatency {17} \
    CONFIG.C0.DDR4_CasWriteLatency {12} \
  ] [get_bd_cells ddr4]
}

if { $PL_DDR_TYPE == "2GB_1200MHz"} {
  set_property -dict [ list \
    CONFIG.C0.DDR4_TimePeriod {833} \
    CONFIG.C0.DDR4_InputClockPeriod {9996} \
    CONFIG.C0.DDR4_MemoryPart {MT40A1G16WBU-083E} \
    CONFIG.C0.DDR4_CasLatency {16} \
    CONFIG.C0.DDR4_CasWriteLatency {12} \
    CONFIG.C0.BANK_GROUP_WIDTH {2} \
    CONFIG.C0.DDR4_DataWidth {16} \
    CONFIG.C0.DDR4_isCustom {true} \
    CONFIG.C0.DDR4_AxiAddressWidth {31} \
    CONFIG.C0.DDR4_AxiDataWidth {128} \
  ] [get_bd_cells ddr4]
}

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect axi_interconnect_0
set_property -dict [ list \
  CONFIG.NUM_MI {1} \
] [get_bd_cells axi_interconnect_0]

if { $PL_ETH == "PL_ETH"} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz clk_wiz_0
  set_property -dict [ list \
    CONFIG.CLKIN1_JITTER_PS {200.0} \
    CONFIG.CLKOUT1_JITTER {129.582} \
    CONFIG.CLKOUT1_PHASE_ERROR {150.623} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {125.000} \
    CONFIG.CLKOUT2_JITTER {129.583} \
    CONFIG.CLKOUT2_PHASE_ERROR {150.623} \
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {125.000} \
    CONFIG.CLKOUT2_REQUESTED_PHASE {90} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.CLKOUT3_JITTER {181.251} \
    CONFIG.CLKOUT3_PHASE_ERROR {150.623} \
    CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {100.000} \
    CONFIG.CLKOUT3_USED {true} \
    CONFIG.CLKOUT4_JITTER {241.956} \
    CONFIG.CLKOUT4_PHASE_ERROR {150.623} \
    CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {100.000} \
    CONFIG.CLKOUT4_USED {true} \
    CONFIG.MMCM_CLKFBOUT_MULT_F {25.000} \
    CONFIG.MMCM_CLKIN1_PERIOD {20.000} \
    CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {10.0} \
    CONFIG.MMCM_CLKOUT1_DIVIDE {10} \
    CONFIG.MMCM_CLKOUT1_PHASE {90} \
    CONFIG.MMCM_CLKOUT2_DIVIDE {50} \
    CONFIG.MMCM_CLKOUT3_DIVIDE {125} \
    CONFIG.MMCM_DIVCLK_DIVIDE {1} \
    CONFIG.NUM_OUT_CLKS {4} \
    CONFIG.OVERRIDE_MMCM {true} \
    CONFIG.PRIM_IN_FREQ {49.9995} \
    CONFIG.PRIM_SOURCE {Global_buffer} \
    CONFIG.RESET_PORT {resetn} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
    CONFIG.USE_LOCKED {true} \
  ] [get_bd_cells clk_wiz_0]
}
set_property -dict [ list \
  CONFIG.PSU__USB3_0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__USB3_0__PERIPHERAL__IO {GT Lane2} \
] [get_bd_cells zynq_ultra_ps_e]

connect_bd_net [get_bd_pins zynq_ultra_ps_e/maxihpm0_lpd_aclk] [get_bd_pins zynq_ultra_ps_e/pl_clk0]
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 ps_sys_rst
connect_bd_net [get_bd_pins ps_sys_rst/slowest_sync_clk] [get_bd_pins zynq_ultra_ps_e/pl_clk0]
connect_bd_net [get_bd_pins ps_sys_rst/ext_reset_in] [get_bd_pins zynq_ultra_ps_e/pl_resetn0]
connect_bd_net [get_bd_pins system_management_wiz/ip2intc_irpt] [get_bd_pins zynq_ultra_ps_e/pl_ps_irq0]
set IIC_FPGA [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_FPGA ]
connect_bd_intf_net [get_bd_intf_ports IIC_FPGA] [get_bd_intf_pins zynq_ultra_ps_e/IIC_1]

if { $PL_DDR == "PL_DDR"} {
  set_property generic BG_WIDTH=1 [current_fileset]
  set C0_SYS_CLK [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 C0_SYS_CLK ]
  connect_bd_intf_net [get_bd_intf_ports C0_SYS_CLK] [get_bd_intf_pins ddr4/C0_SYS_CLK]
  set C0_DDR4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 C0_DDR4 ]
  connect_bd_intf_net [get_bd_intf_ports C0_DDR4] [get_bd_intf_pins ddr4/C0_DDR4]
  create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 ddr4_sys_rst
  if {[catch { connect_bd_net [get_bd_pins zynq_ultra_ps_e/maxihpm0_fpd_aclk] [get_bd_pins ddr4/c0_ddr4_ui_clk] } errmsg]} { puts [string map {ERROR DEBUG} $errmsg] }
  connect_bd_net [get_bd_pins ddr4_sys_rst/ext_reset_in] [get_bd_pins zynq_ultra_ps_e/pl_resetn0]
  connect_bd_net [get_bd_pins ddr4_sys_rst/slowest_sync_clk] [get_bd_pins ddr4/c0_ddr4_ui_clk]
  connect_bd_net [get_bd_pins ddr4_sys_rst/peripheral_aresetn] [get_bd_pins ddr4/c0_ddr4_aresetn]
  connect_bd_net [get_bd_pins ddr4_sys_rst/peripheral_reset] [get_bd_pins ddr4/sys_rst]
}

if { $PL_DDR == "No_PL_DDR"} {
  set_property generic BG_WIDTH=1 [current_fileset]
  set C0_DDR4_ACT_N [ create_bd_port -dir O C0_DDR4_ACT_N ]
  set C0_DDR4_adr [ create_bd_port -dir O -from 16 -to 0 C0_DDR4_adr ]
  set C0_DDR4_ba [ create_bd_port -dir O -from 1 -to 0 C0_DDR4_ba ]
  set C0_DDR4_bg [ create_bd_port -dir O -from 0 -to 0 C0_DDR4_bg ]
  set C0_DDR4_ck_c [ create_bd_port -dir O -from 0 -to 0 C0_DDR4_ck_c ]
  set C0_DDR4_ck_t [ create_bd_port -dir O -from 0 -to 0 C0_DDR4_ck_t ]
  set C0_DDR4_cke [ create_bd_port -dir O -from 0 -to 0 C0_DDR4_cke ]
  set C0_DDR4_cs_n [ create_bd_port -dir O -from 0 -to 0 C0_DDR4_cs_n ]
  set C0_DDR4_dm_n [ create_bd_port -dir IO -from 1 -to 0 C0_DDR4_dm_n ]
  set C0_DDR4_dq [ create_bd_port -dir IO -from 15 -to 0 C0_DDR4_dq ]
  set C0_DDR4_dqs_c [ create_bd_port -dir IO -from 1 -to 0 C0_DDR4_dqs_c ]
  set C0_DDR4_dqs_t [ create_bd_port -dir IO -from 1 -to 0 C0_DDR4_dqs_t ]
  set C0_DDR4_odt [ create_bd_port -dir O -from 0 -to 0 C0_DDR4_odt ]
  set C0_DDR4_reset_n [ create_bd_port -dir O C0_DDR4_reset_n ]
  set C0_SYS_CLK_CLK_N [ create_bd_port -dir I C0_SYS_CLK_CLK_N ]
  set C0_SYS_CLK_CLK_P [ create_bd_port -dir I C0_SYS_CLK_CLK_P ]
  connect_bd_net -net util_ds_buf_1_OBUF_DS_N [get_bd_ports C0_DDR4_ck_c] [get_bd_pins util_ds_buf_0/OBUF_DS_N]
  connect_bd_net -net util_ds_buf_1_OBUF_DS_P [get_bd_ports C0_DDR4_ck_t] [get_bd_pins util_ds_buf_0/OBUF_DS_P]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins util_ds_buf_0/OBUF_IN] [get_bd_pins xlconstant_0/dout]
}

if { $PL_DDR_TYPE == "2GB_1200MHz"} {
  set_property generic BG_WIDTH=2 [current_fileset]
}
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e/M_AXI_HPM0_FPD]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins ddr4/C0_DDR4_S_AXI]
connect_bd_net [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] -boundary_type upper
connect_bd_net [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] -boundary_type upper
connect_bd_net [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] -boundary_type upper
connect_bd_net [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] -boundary_type upper
connect_bd_net [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins ddr4/c0_ddr4_ui_clk]
connect_bd_net [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins ddr4_sys_rst/interconnect_aresetn]

if { $PL_ETH == "PL_ETH"} {
  set GMII [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gmii_rtl:1.0 GMII ]
  set MDIO [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 MDIO ]
  connect_bd_intf_net [get_bd_intf_ports GMII] [get_bd_intf_pins zynq_ultra_ps_e/GMII_ENET1]
  connect_bd_intf_net [get_bd_intf_ports MDIO] [get_bd_intf_pins zynq_ultra_ps_e/MDIO_ENET1]
  set ETH_CLK125 [ create_bd_port -dir O -type clk ETH_CLK125 ]
  set ETH_CLK125_90 [ create_bd_port -dir O -type clk ETH_CLK125_90 ]
  set ETH_CLK25 [ create_bd_port -dir O -type clk ETH_CLK25 ]
  set ETH_CLK10 [ create_bd_port -dir O -type clk ETH_CLK10 ]
  set ETH_resetn [ create_bd_port -dir O ETH_resetn ]
  connect_bd_net -net ETH_CLK125 [get_bd_ports ETH_CLK125] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net CLK_ETH125_90 [get_bd_ports ETH_CLK125_90] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net CLK_ETH25 [get_bd_ports ETH_CLK25] [get_bd_pins clk_wiz_0/clk_out3]
  connect_bd_net -net CLK_ETH10 [get_bd_ports ETH_CLK10] [get_bd_pins clk_wiz_0/clk_out4]
  connect_bd_net -net clk_wiz_0_locked [get_bd_ports ETH_resetn] [get_bd_pins clk_wiz_0/locked]
  connect_bd_net [get_bd_pins clk_wiz_0/resetn] [get_bd_pins zynq_ultra_ps_e/pl_resetn0]
  connect_bd_net [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins zynq_ultra_ps_e/pl_clk1]
}

if { $PL_ETH == "No_PL_ETH"} {
  set ETH_CLK10 [ create_bd_port -dir O ETH_CLK10]
  set ETH_CLK125 [ create_bd_port -dir O ETH_CLK125 ]
  set ETH_CLK125_90 [ create_bd_port -dir O ETH_CLK125_90 ]
  set ETH_CLK25 [ create_bd_port -dir O ETH_CLK25 ]
  set ETH_resetn [ create_bd_port -dir O ETH_resetn ]
  set GMII_col [ create_bd_port -dir I GMII_col ]
  set GMII_crs [ create_bd_port -dir I GMII_crs ]
  set GMII_rx_clk [ create_bd_port -dir I GMII_rx_clk ]
  set GMII_rx_dv [ create_bd_port -dir I GMII_rx_dv ]
  set GMII_rx_er [ create_bd_port -dir I GMII_rx_er ]
  set GMII_rxd [ create_bd_port -dir I -from 7 -to 0 GMII_rxd ]
  set GMII_speed_mode [ create_bd_port -dir O -from 2 -to 0 GMII_speed_mode ]
  set GMII_tx_clk [ create_bd_port -dir I GMII_tx_clk ]
  set GMII_tx_en [ create_bd_port -dir O GMII_tx_en ]
  set GMII_tx_er [ create_bd_port -dir O GMII_tx_er ]
  set GMII_txd [ create_bd_port -dir O -from 7 -to 0 GMII_txd ]
  set MDIO_mdc [ create_bd_port -dir O MDIO_mdc ]
  set MDIO_mdio_i [ create_bd_port -dir I MDIO_mdio_i ]
  set MDIO_mdio_o [ create_bd_port -dir O MDIO_mdio_o ]
  set MDIO_mdio_t [ create_bd_port -dir O MDIO_mdio_t ]
}

create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_00
set_property -dict [list CONFIG.NUM_MI {2} CONFIG.NUM_CLKS {1} CONFIG.NUM_SI {1}] [get_bd_cells smartconnect_00]
connect_bd_intf_net [get_bd_intf_pins zynq_ultra_ps_e/M_AXI_HPM0_LPD] [get_bd_intf_pins smartconnect_00/S00_AXI]
connect_bd_net [get_bd_pins zynq_ultra_ps_e/pl_clk0] [get_bd_pins smartconnect_00/aclk]
connect_bd_net [get_bd_pins ps_sys_rst/interconnect_aresetn] [get_bd_pins smartconnect_00/aresetn]
connect_bd_intf_net [get_bd_intf_pins smartconnect_00/M00_AXI ] [get_bd_intf_pins system_management_wiz/S_AXI_LITE]
connect_bd_intf_net [get_bd_intf_pins smartconnect_00/M01_AXI ] [get_bd_intf_pins led/S_AXI]

connect_bd_net [get_bd_pins ps_sys_rst/peripheral_aresetn] [get_bd_pins system_management_wiz/s_axi_aresetn]
connect_bd_net [get_bd_pins zynq_ultra_ps_e/pl_clk0] [get_bd_pins system_management_wiz/s_axi_aclk]
connect_bd_net [get_bd_pins ps_sys_rst/peripheral_aresetn] [get_bd_pins led/s_axi_aresetn]
connect_bd_net [get_bd_pins zynq_ultra_ps_e/pl_clk0] [get_bd_pins led/s_axi_aclk]

set DP_AUX_OUT [ create_bd_port -dir O DP_AUX_OUT]
connect_bd_net [get_bd_ports DP_AUX_OUT] [get_bd_pins zynq_ultra_ps_e/dp_aux_data_out]
set DP_AUX_OE [ create_bd_port -dir O DP_AUX_OE]
connect_bd_net [get_bd_ports DP_AUX_OE] [get_bd_pins zynq_ultra_ps_e/dp_aux_data_oe_n]
set DP_AUX_IN [ create_bd_port -dir I DP_AUX_IN]
connect_bd_net [get_bd_ports DP_AUX_IN] [get_bd_pins zynq_ultra_ps_e/dp_aux_data_in]
set DP_HPD [ create_bd_port -dir I DP_HPD]
connect_bd_net [get_bd_ports DP_HPD] [get_bd_pins zynq_ultra_ps_e/dp_hot_plug_detect]
set Clk100 [ create_bd_port -dir O -type clk Clk100]
connect_bd_net [get_bd_ports Clk100] [get_bd_pins zynq_ultra_ps_e/pl_clk0]
set Clk50 [ create_bd_port -dir O -type clk Clk50]
connect_bd_net [get_bd_ports Clk50] [get_bd_pins zynq_ultra_ps_e/pl_clk1]
set Rst_N [ create_bd_port -dir O -type rst Rst_N]
connect_bd_net [get_bd_ports Rst_N] [get_bd_pins zynq_ultra_ps_e/pl_resetn0]
set LED_N_PL [ create_bd_port -dir O -from 1 -to 0 LED_N_PL]
connect_bd_net [get_bd_ports LED_N_PL] [get_bd_pins led/gpio_io_o]
assign_bd_address
save_bd_design
validate_bd_design
save_bd_design
