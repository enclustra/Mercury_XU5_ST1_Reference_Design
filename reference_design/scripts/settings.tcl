# ----------------------------------------------------------------------------------
# Copyright (c) 2021 by Enclustra GmbH, Switzerland.
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

# Project settings for Mercury XU5 Reference Design
# Valid module codes
# ME-XU5-2CG-1E-D10H
# ME-XU5-2EG-1I-D11E
# ME-XU5-3EG-2I-D11E
# ME-XU5-4CG-1E-D11E-G1
# ME-XU5-4EV-1I-D11E
# ME-XU5-4EV-1I-D11E-G1
# ME-XU5-5EV-2I-D12E
# ME-XU5-5EV-1E-D11E
# ME-XU5-5EV-2I-D12E-G1
# ME-XU5-5EV-3E-D13E

# ----------------------------------------------------------------------------------
# Modify this variable to select your module
if {![info exists module_name]} {set module_name ME-XU5-2CG-1E-D10H}
if {![info exists baseboard]}   {set baseboard ST1}
# ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# Don't modify anything beyond this line
# ----------------------------------------------------------------------------------

#if any file argument are present, use this value
if {[lindex $argv 0] != ""} { set module_name [lindex $argv 0] }

set module Mercury_XU5

switch $module_name {
  ME-XU5-2CG-1E-D10H {
    set part xczu2cg-sfvc784-1-e 
    set ETH_PHASE ETH_PHASE_76_5
    set PS_DDR PS_D10H
    set PL_DDR PL_1_D10H
    set MGT_routing G1
  }
  ME-XU5-2EG-1I-D11E {
    set part xczu2eg-sfvc784-1-i 
    set ETH_PHASE ETH_PHASE_76_5
    set PS_DDR PS_D11E
    set PL_DDR PL_1_D10H
    set MGT_routing G1
  }
  ME-XU5-3EG-2I-D11E {
    set part xczu3eg-sfvc784-2-i 
    set ETH_PHASE ETH_PHASE_76_5
    set PS_DDR PS_D11E
    set PL_DDR PL_2_D11E
    set MGT_routing G1
  }
  ME-XU5-4CG-1E-D11E-G1 {
    set part xczu4cg-sfvc784-1-e 
    set ETH_PHASE ETH_PHASE_90
    set PS_DDR PS_D11E
    set PL_DDR PL_1_D10H
    set MGT_routing G1
  }
  ME-XU5-4EV-1I-D11E {
    set part xczu4ev-sfvc784-1-i 
    set ETH_PHASE ETH_PHASE_90
    set PS_DDR PS_D11E
    set PL_DDR PL_1_D10H
    set MGT_routing None
  }
  ME-XU5-4EV-1I-D11E-G1 {
    set part xczu4ev-sfvc784-1-i 
    set ETH_PHASE ETH_PHASE_90
    set PS_DDR PS_D11E
    set PL_DDR PL_1_D10H
    set MGT_routing G1
  }
  ME-XU5-5EV-2I-D12E {
    set part xczu5ev-sfvc784-2-i 
    set ETH_PHASE ETH_PHASE_90
    set PS_DDR PS_D12E
    set PL_DDR PL_2_D12E
    set MGT_routing None
  }
  ME-XU5-5EV-1E-D11E {
    set part xczu5ev-sfvc784-1-e 
    set ETH_PHASE ETH_PHASE_90
    set PS_DDR PS_D11E
    set PL_DDR PL_1_D10H
    set MGT_routing None
  }
  ME-XU5-5EV-2I-D12E-G1 {
    set part xczu5ev-sfvc784-2-i 
    set ETH_PHASE ETH_PHASE_90
    set PS_DDR PS_D12E
    set PL_DDR PL_2_D12E
    set MGT_routing G1
  }
  ME-XU5-5EV-3E-D13E {
    set part xczu5ev-sfvc784-3-e 
    set ETH_PHASE ETH_PHASE_90
    set PS_DDR PS_D13E
    set PL_DDR PL_2_D13E
    set MGT_routing None
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
    puts $project_name
  }
  set project_name [string map {" " "_"} "${project_name}"]
}

puts "INFO: settings.tcl file loaded."
