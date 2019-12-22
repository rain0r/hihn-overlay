# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python3_{6,7} )

inherit git-r3 distutils-r1

DESCRIPTION="Dashboard to monitor Tor node operations"
HOMEPAGE="https://github.com/ralphwetzel/theonionbox"
EGIT_REPO_URI="https://github.com/ralphwetzel/theonionbox.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
