FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
           file://sysfsgpio-ettus-magnesium-dba.cfg \
           file://sysfsgpio-ettus-magnesium-dbb.cfg \
	"
do_install_append() {
    install -D -m 0644 ${WORKDIR}/sysfsgpio-ettus-magnesium-dba.cfg ${D}${datadir}/openocd/scripts/interface
    install -D -m 0644 ${WORKDIR}/sysfsgpio-ettus-magnesium-dbb.cfg ${D}${datadir}/openocd/scripts/interface
}

PACKAGECONFIG[axi_bitq] = "--enable-axi_bitq,--disable-axi_bitq"
PACKAGECONFIG += "sysfsgpio axi_bitq"
