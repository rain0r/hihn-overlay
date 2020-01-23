# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CRATES="
num_cpus-1.10.1
humansize-1.1.0
num-format-0.4.0
rayon-1.2.0
crossbeam-channel-0.3.9
atty-0.2.13
clap-2.33.0
tempdir-0.3.7
libc-0.2.62
winapi-0.3.8
bitflags-1.1.0
strsim-0.8.0
"

inherit bash-completion-r1 cargo

DESCRIPTION="A minimal, fast alternative to 'du -sh'"
HOMEPAGE="https://github.com/sharkdp/diskus"
SRC_URI="https://github.com/sharkdp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 BSD-2 ISC MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="/usr/bin/diskus"

src_compile() {
	export SHELL_COMPLETIONS_DIR="${T}/shell_completions"
	# this enables to build with system jemallloc, but musl targets do not use it at all
	# use elibc_musl || export JEMALLOC_OVERRIDE="${ESYSROOT}/usr/$(get_libdir)/libjemalloc.so"
	cargo_src_compile
}

src_install() {
	cargo_src_install

	newbashcomp "${T}"/shell_completions/diskus.bash diskus
	insinto /usr/share/zsh/site-functions
	doins "${T}"/shell_completions/_diskus
	insinto /usr/share/fish/vendor_completions.d
	doins "${T}"/shell_completions/diskus.fish
	dodoc README.md
	doman doc/*.1
}
