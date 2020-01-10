DEPENDS += "uhd"

# set the UHD images you want to download
UHD_IMAGES_TO_DOWNLOAD ??= ""
UHD_IMAGES_DOWNLOAD_DIR ??= "${S}"
UHD_BASE_URL ??= ""

addtask do_download_uhd_images after do_prepare_recipe_sysroot before do_compile

do_download_uhd_images() {
    DOWNLOADER="python3 ${WORKDIR}/recipe-sysroot/usr/lib/uhd/utils/uhd_images_downloader.py"
    DOWNLOADER_OPTS="-i ${UHD_IMAGES_DOWNLOAD_DIR}"
    if [ -n "${UHD_BASE_URL}" ]; then
        DOWNLOADER_OPTS="$DOWNLOADER_OPTS -b ${UHD_BASE_URL}"
    fi
    for type in ${UHD_IMAGES_TO_DOWNLOAD}; do
        $DOWNLOADER $DOWNLOADER_OPTS -t "$type"
    done
}
