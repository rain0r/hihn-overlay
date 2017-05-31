# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python3_3 python3_4 python3_5 python3_6)
inherit distutils-r1 eutils git-r3 autotools
MY_PV=${PV/_beta/-beta.}
MY_P=${PN}-${MY_PV}
DESCRIPTION="A webradio player with text user interface."
EGIT_REPO_URI="https://git.hihn.org/rain0r/radioradio.git"
HOMEPAGE="https://git.hihn.org/rain0r/radioradio"
KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPLv3"
IUSE=""

RDEPEND=">=dev-python/urwid-1.3.0[${PYTHON_USEDEP}]
	>=media-video/mplayer-1.0.0"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${MY_P}
