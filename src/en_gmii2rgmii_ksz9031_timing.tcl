# ----------------------------------------------------------------------------------
# Copyright (c) 2025 by Enclustra GmbH, Switzerland.
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
# ----------------------------------------------------------------------------------

# MDIO clock
create_generated_clock -name clock_mdio -source [get_pins */zynq_ultra_ps_e/U0/PS8_i/EMIOENET1MDIOMDC] -multiply_by 1 [get_ports ETH1_MDC]

# MDIO timing
set_input_delay -clock [get_clocks clock_mdio] -max 80 [get_ports ETH1_MDIO]
set_input_delay -clock [get_clocks clock_mdio] -min 0 [get_ports ETH1_MDIO]
set_output_delay -clock [get_clocks clock_mdio] -min 8 [get_ports ETH1_MDIO]
set_output_delay -clock [get_clocks clock_mdio] -max 8 [get_ports ETH1_MDIO]

# RGMII RX clock (-0.18 ns shifted in PHY and inverted in FPGA)
create_clock -period 8.000 -name RGMII_RX_CLK -waveform {7.82 11.82} [get_ports ETH1_RXCLK]
create_clock -period 8.000 -name RGMII_RX_CLK_VIRT

# RGMII TX clock (2 ns shifted by PLL)
create_generated_clock -name RGMII_TX_CLK_90 -source [get_pins */clk_wiz_gmii2rgmii/clk_out2] -multiply_by 1 [get_ports ETH1_TXCLK]

# Make sure delay of RGMII TX clock is preserved at output registers
set_property CLOCK_DELAY_GROUP rgmii_tx_group [get_nets -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/clkout1_buf/O]]
set_property CLOCK_DELAY_GROUP rgmii_tx_group [get_nets -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/clkout2_buf/O]]

# RGMII RX timing
set_input_delay -clock RGMII_RX_CLK_VIRT -min -0.5 [get_ports {ETH1_RXD[0] ETH1_RXD[1] ETH1_RXD[2] ETH1_RXD[3] ETH1_RXCTL}] -add_delay
set_input_delay -clock RGMII_RX_CLK_VIRT -max 0.5 [get_ports {ETH1_RXD[0] ETH1_RXD[1] ETH1_RXD[2] ETH1_RXD[3] ETH1_RXCTL}] -add_delay
set_input_delay -clock RGMII_RX_CLK_VIRT -clock_fall -min -0.5 [get_ports {ETH1_RXD[0] ETH1_RXD[1] ETH1_RXD[2] ETH1_RXD[3] ETH1_RXCTL}] -add_delay
set_input_delay -clock RGMII_RX_CLK_VIRT -clock_fall -max 0.5 [get_ports {ETH1_RXD[0] ETH1_RXD[1] ETH1_RXD[2] ETH1_RXD[3] ETH1_RXCTL}] -add_delay

# Set false paths to ensure that correct edges are used for RX timing check
set_false_path -rise_from RGMII_RX_CLK_VIRT -rise_to RGMII_RX_CLK -setup
set_false_path -fall_from RGMII_RX_CLK_VIRT -fall_to RGMII_RX_CLK -setup
set_false_path -rise_from RGMII_RX_CLK_VIRT -fall_to RGMII_RX_CLK -hold
set_false_path -fall_from RGMII_RX_CLK_VIRT -rise_to RGMII_RX_CLK -hold

# RGMII TX timing
set_output_delay -clock RGMII_TX_CLK_90 -min -1.0 [get_ports {ETH1_TXD[0] ETH1_TXD[1] ETH1_TXD[2] ETH1_TXD[3] ETH1_TXCTL}] -add_delay
set_output_delay -clock RGMII_TX_CLK_90 -max 1.0 [get_ports {ETH1_TXD[0] ETH1_TXD[1] ETH1_TXD[2] ETH1_TXD[3] ETH1_TXCTL}] -add_delay
set_output_delay -clock RGMII_TX_CLK_90 -clock_fall -min -1.0 [get_ports {ETH1_TXD[0] ETH1_TXD[1] ETH1_TXD[2] ETH1_TXD[3] ETH1_TXCTL}] -add_delay
set_output_delay -clock RGMII_TX_CLK_90 -clock_fall -max 1.0 [get_ports {ETH1_TXD[0] ETH1_TXD[1] ETH1_TXD[2] ETH1_TXD[3] ETH1_TXCTL}] -add_delay

# Set multicycle and false paths to ensure that correct edges are used for TX timing check
set_multicycle_path -fall_from [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -fall_to RGMII_TX_CLK_90 -setup -start 0
set_multicycle_path -rise_from [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -rise_to RGMII_TX_CLK_90 -setup -start 0
set_multicycle_path -rise_from [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -fall_to RGMII_TX_CLK_90 -hold -start 0
set_multicycle_path -fall_from [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -rise_to RGMII_TX_CLK_90 -hold -start 0

set_false_path -rise_from [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -fall_to RGMII_TX_CLK_90 -setup
set_false_path -fall_from [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -rise_to RGMII_TX_CLK_90 -setup
set_false_path -rise_from [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -rise_to RGMII_TX_CLK_90 -hold
set_false_path -fall_from [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -fall_to RGMII_TX_CLK_90 -hold

# Three clocks are defined on the same clock net (output of clock multiplexer), no clock crossing exists between these clocks
create_generated_clock -name RGMII_RX_CLK2_5 -source [get_pins i_gmii2rgmii/i_rgmii_Div4/O] -multiply_by 1 [get_pins i_gmii2rgmii/i_rgmii_mux0/O]
create_generated_clock -name RGMII_RX_CLK25 -source [get_pins */clk_wiz_gmii2rgmii/clk_out3] -master_clock [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT2]] -multiply_by 1 [get_pins i_gmii2rgmii/i_rgmii_mux0/O] -add
create_generated_clock -name RGMII_RX_CLK125 -source [get_pins */clk_wiz_gmii2rgmii/clk_out1] -master_clock [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -multiply_by 1 [get_pins i_gmii2rgmii/i_rgmii_mux0/O] -add
set_clock_groups -quiet -logically_exclusive -group RGMII_RX_CLK2_5 -group RGMII_RX_CLK25 -group RGMII_RX_CLK125

# There is no relationship between RGMII RX clock and internal clock
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins */clk_wiz_gmii2rgmii/inst/mmcme4_adv_inst/CLKOUT0]] -group [get_clocks RGMII_RX_CLK]
