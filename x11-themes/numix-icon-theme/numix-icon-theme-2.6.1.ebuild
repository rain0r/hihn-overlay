# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Official icon theme from the Numix project."
HOMEPAGE="https://numixproject.org"
SRC_URI="https://github.com/numixproject/numix-gtk-theme/archive/${PV}.tar.gz"
LICENSE="GPL-3+"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/icons
	doins -r Numix Numix-Light
	dodoc readme.md
}
