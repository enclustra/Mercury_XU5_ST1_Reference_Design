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

# Place all cells connected to ETH1_RXCLK in one single clock region
create_pblock pblock_gmii_to_rgmii
add_cells_to_pblock [get_pblocks pblock_gmii_to_rgmii] [get_cells -of_objects [get_nets [list i_gmii2rgmii/RGMII_rxclk]]]
add_cells_to_pblock [get_pblocks pblock_gmii_to_rgmii] [get_cells -of_objects [get_nets [list i_gmii2rgmii/RGMII_rxclk_buf]]]
resize_pblock [get_pblocks pblock_gmii_to_rgmii] -add CLOCKREGION_[get_clock_regions -of_objects [get_iobanks -of_objects [get_ports ETH1_RXCLK]]]
set_property CONTAIN_ROUTING true [get_pblocks pblock_gmii_to_rgmii]
