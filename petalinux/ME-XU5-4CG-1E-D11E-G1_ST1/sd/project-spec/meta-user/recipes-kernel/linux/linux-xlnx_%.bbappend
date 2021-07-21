FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += " file://si5338.patch"
SRC_URI += " file://qspi.patch"
