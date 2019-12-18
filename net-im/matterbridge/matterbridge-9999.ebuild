# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs user

EGO_PN="github.com/42wim/matterbridge"

KEYWORDS="~amd64"

DESCRIPTION="Bridge between multiple chat networks"
HOMEPAGE="https://github.com/42wim/matterbridge"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/go-1.8:*"

pkg_setup() {
	enewgroup matterbridge
	enewuser matterbridge -1 -1 -1 matterbridge
}

src_install() {
	default

	newinitd "${FILESDIR}/${PN}.initd" matterbridge
	dobin matterbridge
	fowners matterbridge:matterbridge /usr/bin/matterbridge || die "fowners failed"
}
