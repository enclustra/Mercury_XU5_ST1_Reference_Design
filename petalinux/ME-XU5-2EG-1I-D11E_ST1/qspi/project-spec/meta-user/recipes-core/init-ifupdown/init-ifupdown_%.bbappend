SRC_URI += " \
        file://interfaces_dual_eth \
        "
  
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_install_append() {
     install -m 0644 ${WORKDIR}/interfaces_dual_eth ${D}${sysconfdir}/network/interfaces
}
