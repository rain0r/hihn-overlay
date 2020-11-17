# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{6..9})

DISTUTILS_USE_SETUPTOOLS=rdepend

inherit bash-completion-r1 distutils-r1 readme.gentoo-r1

DESCRIPTION="Download videos from YouTube.com (and more sites...)"
HOMEPAGE="https://youtube-dl.org/ https://github.com/ytdl-org/youtube-dl/"
EGIT_REPO_URI="https://github.com/ytdl-org/youtube-dl.git"
S=${WORKDIR}/${PN}

LICENSE="public-domain"
KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
SLOT="0"

RDEPEND="
	dev-python/pycryptodome[${PYTHON_USEDEP}]
"

distutils_enable_tests nose

src_prepare() {
	sed -i -e '/flake8/d' Makefile || die
	distutils-r1_src_prepare
}

python_test() {
	emake offlinetest
}

python_install_all() {
	dodoc README.txt
	doman ${PN}.1

	newbashcomp ${PN}.bash-completion ${PN}

	insinto /usr/share/zsh/site-functions
	newins ${PN}.zsh _${PN}

	insinto /usr/share/fish/vendor_completions.d
	doins ${PN}.fish

	distutils-r1_python_install_all

	rm -r "${ED}"/usr/etc || die
	rm -r "${ED}"/usr/share/doc/youtube_dl || die
}
