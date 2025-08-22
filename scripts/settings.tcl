# ----------------------------------------------------------------------------------------------------
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
# ----------------------------------------------------------------------------------------------------

# Project settings for Mercury XU5 Reference Design
# Valid module codes
# ME-XU5-2CG-1E-D10H
# ME-XU5-2EG-1I-D11E
# ME-XU5-3EG-2I-D11E
# ME-XU5-4EV-1I-D11E
# ME-XU5-4EV-1I-D11E-G1
# ME-XU5-5EV-2I-D12E

# ----------------------------------------------------------------------------------------------------
# Modify this variable to select your module
if {![info exists module_name]} {set module_name ME-XU5-2CG-1E-D10H}
if {![info exists baseboard]}   {set baseboard ST1}
if {![info exists vivado_dir]} {set vivado_dir [file join Vivado ${module_name}] }
# ----------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------
# Don't modify anything beyond this line
# ----------------------------------------------------------------------------------------------------

#if any file argument are present, use this value
if {[lindex $argv 0] != ""} { set module_name [lindex $argv 0] }

set module Mercury_XU5
set family zynqmp

switch $module_name {
  ME-XU5-2CG-1E-D10H {
    set part xczu2cg-sfvc784-1-e 
    set PS_DDR_TYPE PS_D10H
    set PL_DDR PL_DDR
    set PL_DDR_TYPE 512MB_1066MHz
    set MGT_routing No_MGT_routing
    set PS_ETH PS_ETH
    set PS_USB0 PS_USB0
    set PS_USB1 PS_USB1
    set PS_EMMC PS_EMMC
    set PS_QSPI PS_QSPI
  }
  ME-XU5-2EG-1I-D11E {
    set part xczu2eg-sfvc784-1-i 
    set PS_DDR_TYPE PS_D11E
    set PL_DDR PL_DDR
    set PL_DDR_TYPE 512MB_1066MHz
    set MGT_routing No_MGT_routing
    set PS_ETH PS_ETH
    set PS_USB0 PS_USB0
    set PS_USB1 PS_USB1
    set PS_EMMC PS_EMMC
    set PS_QSPI PS_QSPI
  }
  ME-XU5-3EG-2I-D11E {
    set part xczu3eg-sfvc784-2-i 
    set PS_DDR_TYPE PS_D11E
    set PL_DDR PL_DDR
    set PL_DDR_TYPE 512MB_1200MHz
    set MGT_routing No_MGT_routing
    set PS_ETH PS_ETH
    set PS_USB0 PS_USB0
    set PS_USB1 PS_USB1
    set PS_EMMC PS_EMMC
    set PS_QSPI PS_QSPI
  }
  ME-XU5-4EV-1I-D11E {
    set part xczu4ev-sfvc784-1-i 
    set PS_DDR_TYPE PS_D11E
    set PL_DDR PL_DDR
    set PL_DDR_TYPE 512MB_1066MHz
    set MGT_routing Standard
    set PS_ETH PS_ETH
    set PS_USB0 PS_USB0
    set PS_USB1 PS_USB1
    set PS_EMMC PS_EMMC
    set PS_QSPI PS_QSPI
  }
  ME-XU5-4EV-1I-D11E-G1 {
    set part xczu4ev-sfvc784-1-i 
    set PS_DDR_TYPE PS_D11E
    set PL_DDR PL_DDR
    set PL_DDR_TYPE 512MB_1066MHz
    set MGT_routing G1
    set PS_ETH PS_ETH
    set PS_USB0 PS_USB0
    set PS_USB1 PS_USB1
    set PS_EMMC PS_EMMC
    set PS_QSPI PS_QSPI
  }
  ME-XU5-5EV-2I-D12E {
    set part xczu5ev-sfvc784-2-i 
    set PS_DDR_TYPE PS_D12E
    set PL_DDR PL_DDR
    set PL_DDR_TYPE 1GB_1200MHz
    set MGT_routing Standard
    set PS_ETH PS_ETH
    set PS_USB0 PS_USB0
    set PS_USB1 PS_USB1
    set PS_EMMC PS_EMMC
    set PS_QSPI PS_QSPI
  }
  default {
    puts "$module_name not available"
    break
  }
}

#create project name for design
if {![info exists project_name]} {
  set project_name ${module}
  if {[info exists baseboard]} {
    lappend project_name ${baseboard}
  }
  set project_name [string map {" " "_"} "${project_name}"]
}

puts "INFO: settings.tcl file loaded."
