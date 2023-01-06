SRC_URI += " \
        file://interfaces_dual_eth \
        "

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_install:append() {
     install -m 0644 ${WORKDIR}/interfaces_dual_eth ${D}${sysconfdir}/network/interfaces
}
