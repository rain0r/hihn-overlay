# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3
DESCRIPTION="Official icon theme circle from the Numix project."
HOMEPAGE="https://numixproject.org"
SRC_URI=""
EGIT_REPO_URI="ssh://git@hihn.org:3390/rain0r/numix-icon-theme-circle.git"
KEYWORDS=""
KEYWORDS="~amd64"
LICENSE="GPL-3+"
SLOT="0"

DEPEND="x11-themes/numix-icon-theme"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/icons
	doins -r Numix-Circle Numix-Circle-Light
	dodoc README.md
}
