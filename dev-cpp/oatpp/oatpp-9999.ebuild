# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="Modern Web Framework for C++"
HOMEPAGE="https://github.com/oatpp/oatpp"
EGIT_REPO_URI="https://github.com/oatpp/oatpp"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
    cmake-utils_src_install
}