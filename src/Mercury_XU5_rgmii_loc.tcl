# ----------------------------------------------------------------------------------
# Copyright (c) 2020 by Enclustra GmbH, Switzerland.
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

# manual RGMII input clock buffer placement to increase delay
set fpga_part [ get_parts -of_objects [get_projects] ]
set device_is_2cg [ expr { $fpga_part eq "xczu2cg-sfvc784-1-e" } ]
set device_is_2eg [ expr { $fpga_part eq "xczu2eg-sfvc784-1-i" } ]
set device_is_3eg [ expr { $fpga_part eq "xczu3eg-sfvc784-2-i" } ]
set location_select [ expr { $device_is_2cg || $device_is_2eg || $device_is_3eg } ]
set bufg_location [ expr { $location_select ? "BUFGCE_HDIO_X1Y1" : "BUFGCE_HDIO_X0Y3"} ]

set_property BEL BUFCE [get_cells i_gmii2rgmii/i_rgmii_rxclk_buf]
set_property LOC $bufg_location [get_cells i_gmii2rgmii/i_rgmii_rxclk_buf]
