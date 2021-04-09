FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
                 file://chrony.conf \
"

FILES_${PN}_append = " \
                     ${sysconfdir}/ichrony.conf \
"

do_install_append() {
  if ${@bb.utils.contains('PACKAGECONFIG','chrony','true','false',d)}; then
    if [ -e ${D}${sysconfdir}/chrony.conf ]; then
      rm ${D}${sysconfdir}/chrony.conf
    fi;

    install -m 0644 ${WORKDIR}/chrony.conf ${D}${sysconfdir}/chrony.conf
  fi;
}
