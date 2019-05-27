# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker xdg-utils

DESCRIPTION="ModelIO Modelling Package"
HOMEPAGE="https://www.modelio.org/"
LICENSE="GPL-2"
SLOT="0"
SRC_URI="
	https://www.modelio.org/download/send/31-modelio-3-8-1/147-modelio-3-8-1-debian-ubuntu-64-bit.html
"

KEYWORDS="~amd64 amd64"

RDEPEND="
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	gnome-base/gconf:2
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	net-print/cups
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libnotify
	x11-libs/pango[X]
"

QA_PREBUILT="*"
S=${WORKDIR}

src_unpack() {
	unpack_deb ${A}
}

src_prepare() {
	default

}

src_install() {
	mv * "${D}" || die

	MODELIO_VERSION="3.8"
	MODELIO_PATH="/usr/lib/modelio-open-source${MODELIO_VERSION}"
	MODELIO_LNK="/usr/bin/modelio-open-source${MODELIO_VERSION}"
	echo "${ED}/${MODELIO_PATH}/modelio"

	dodir "usr/bin"
	fperms a+x "${MODELIO_PATH}/modelio"
	fperms a+x "${MODELIO_PATH}/modelio.sh"
	dosym "${MODELIO_PATH}/modelio.sh" "${MODELIO_LNK}"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
