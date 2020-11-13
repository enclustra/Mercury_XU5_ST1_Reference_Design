# ----------------------------------------------------------------------------------------------------
# --  Customer         : Enclustra GmbH
# --  Project          : Mercury XU5 Reference Design
# --  File description : Location constraints file for RGMII of PL ETH
# --  File name        : XU5_rgmii_loc.tcl
# --  Authors          : Andreas Buerkler
# ----------------------------------------------------------------------------------------------------
# --  Copyright (c) 2019 by Enclustra GmbH, Switzerland
# --  All rights reserved.
# ----------------------------------------------------------------------------------------------------

# manual RGMII input clock buffer placement to increase delay
set fpga_part [ get_parts -of_objects [get_projects] ]
set device_is_2cg [ expr { $fpga_part eq "xczu2cg-sfvc784-1-e" } ]
set device_is_2eg [ expr { $fpga_part eq "xczu2eg-sfvc784-1-i" } ]
set device_is_3eg [ expr { $fpga_part eq "xczu3eg-sfvc784-2-i" } ]
set location_select [ expr { $device_is_2cg || $device_is_2eg || $device_is_3eg } ]
set bufg_location [ expr { $location_select ? "BUFGCE_HDIO_X1Y1" : "BUFGCE_HDIO_X0Y3"} ]

set_property BEL BUFCE [get_cells i_gmii2rgmii/i_rgmii_rxclk_buf]
set_property LOC $bufg_location [get_cells i_gmii2rgmii/i_rgmii_rxclk_buf]
