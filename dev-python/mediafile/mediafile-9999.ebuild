# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit git-r3 distutils-r1

DESCRIPTION="A formatter for Python files"
HOMEPAGE="https://github.com/beetbox/mediafile"
SRC_URI=""
EGIT_REPO_URI="https://github.com/beetbox/mediafile.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
