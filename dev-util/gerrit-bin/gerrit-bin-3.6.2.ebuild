# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit user systemd

DESCRIPTION="Code review and repository management solution for git"
HOMEPAGE="https://www.gerritcodereview.com/"
LICENSE="MIT"
SRC_URI="https://gerrit-releases.storage.googleapis.com/${PN/-bin/}-${PV}.war -> ${P}.war"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux"
IUSE=""

RDEPEND="
	>=virtual/jre-11"

S=${WORKDIR}

GERRIT_DIR=/var/lib/gerrit

pkg_setup() {
	enewgroup gerrit
	enewuser gerrit -1 -1 ${GERRIT_DIR} gerrit
}

src_install() {
	keepdir /var/log/gerrit ${GERRIT_DIR}/backup ${GERRIT_DIR}/home

	insinto /opt/gerrit
	newins "${DISTDIR}"/${P}.war ${PN/-bin/}.war

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/${PN}-r1.logrotate ${PN/-bin/}

	newinitd "${FILESDIR}"/${PN}.init2 gerrit
	newconfd "${FILESDIR}"/${PN}.confd gerrit

	systemd_newunit "${FILESDIR}"/${PN}.service2 gerrit.service

	fowners gerrit:gerrit /var/log/gerrit ${GERRIT_DIR} ${GERRIT_DIR}/home ${GERRIT_DIR}/backup
}
