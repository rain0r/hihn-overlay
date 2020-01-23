# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CRATES="
atty-0.2.13
libc-0.2.62
clap-2.33.0
ansi_term-0.11.0
atty-0.2.13
bitflags-1.1.0
strsim-0.8.0
term_size-0.3.1
libc-0.2.62
textwrap-0.11.0
term_size-0.3.1
unicode-width-0.1.6
unicode-width-0.1.6
vec_map-0.8.1
crossbeam-channel-0.3.9
crossbeam-utils-0.6.6
cfg-if-0.1.9
lazy_static-1.4.0
humansize-1.1.0
num-format-0.4.0
arrayvec-0.4.11
nodrop-0.1.13
itoa-0.4.4
num_cpus-1.10.1
libc-0.2.62
rayon-1.2.0
crossbeam-deque-0.7.1
crossbeam-epoch-0.7.2
arrayvec-0.4.11
cfg-if-0.1.9
crossbeam-utils-0.6.6
lazy_static-1.4.0
memoffset-0.5.1
rustc_version-0.2.3
semver-0.9.0
semver-parser-0.7.0
scopeguard-1.0.0
crossbeam-utils-0.6.6
either-1.5.3
rayon-core-1.6.0
crossbeam-deque-0.7.1
crossbeam-queue-0.1.2
crossbeam-utils-0.6.6
crossbeam-utils-0.6.6
lazy_static-1.4.0
num_cpus-1.10.1
tempdir-0.3.7
rand-0.4.6
libc-0.2.62
remove_dir_all-0.5.2
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
