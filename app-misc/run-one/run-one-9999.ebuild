# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Run one instance of some unique combination of command and arguments at a time"
HOMEPAGE="https://github.com/dustinkirkland/run-one"
EGIT_REPO_URI="https://github.com/dustinkirkland/run-one"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


src_install() {
	insinto /usr/bin/
	doins run-one
}
