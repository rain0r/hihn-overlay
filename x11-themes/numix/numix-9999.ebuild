# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="modern flat theme"
HOMEPAGE="https://github.com/numixproject/numix-gtk-theme"
EGIT_REPO_URI="https://git.hihn.org/rain0r/numix-gtk-theme.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="
	x11-themes/gtk-engines-murrine
	dev-ruby/sass
"
DEPEND="
	${RDEPEND}
"

RESTRICT="binchecks strip"

pkg_preinst() {
	# Remove all older versions of the theme from the system
	rm -rf /usr/share/themes/numix
}

src_install() {
	insinto /usr/share/themes/${PN}
	doins -r *
}

