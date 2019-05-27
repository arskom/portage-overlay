# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
CHROMIUM_LANGS="
	be bg bn ca cs da de el en-GB en-US es-419 es fil fi fr-CA fr hi hr hu id
	it ja ko lt lv ms nb nl pl pt-BR pt-PT ro ru sk sr sv sw ta te th tr uk vi
	zh-CN zh-TW

"
inherit chromium-2 multilib unpacker xdg-utils

DESCRIPTION="A fast and secure web browser"
HOMEPAGE="https://www.opera.com/"
LICENSE="OPERA-2014"
SLOT="0"
SRC_URI="
	https://www.modelio.org/download/send/31-modelio-3-8-1/147-modelio-3-8-1-debian-ubuntu-64-bit.html
"

KEYWORDS="~amd64"

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
