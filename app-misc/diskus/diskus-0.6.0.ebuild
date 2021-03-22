# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
num_cpus-1.13.0
humansize-1.1.0
num-format-0.4.0
rayon-1.5.0
crossbeam-channel-0.5.0
atty-0.2.0
${P}
"

inherit cargo flag-o-matic

DESCRIPTION="A minimal, fast alternative to 'du -sh'."
HOMEPAGE="https://github.com/sharkdp/diskus"
SRC_URI="$(cargo_crate_uris ${CRATES})"

LICENSE="BSD Apache-2.0 MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"

IUSE=""

RESTRICT="mirror"

src_prepare() {
	filter-flags -flto*  # building fails when compiling with LTO

	default
}

src_install() {
	insinto "/usr/share/${P}/examples"
	doins   "${S}/assets/vim_style_key_config.ron"

	dodoc README.md

	cargo_src_install
}