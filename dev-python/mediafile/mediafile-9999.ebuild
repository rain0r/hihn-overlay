# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python3_{7,8} )

inherit git-r3 distutils-r1

DESCRIPTION="A formatter for Python files"
HOMEPAGE="https://github.com/beetbox/mediafile"
EGIT_REPO_URI="https://github.com/beetbox/mediafile.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DISTUTILS_USE_SETUPTOOLS="pyproject.toml"
BDEPEND="dev-python/pyproject2setuppy[${PYTHON_USEDEP}]"
