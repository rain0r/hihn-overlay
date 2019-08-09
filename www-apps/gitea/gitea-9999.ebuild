# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit user autotools git-r3 golang-base
DESCRIPTION="A painless self-hosted Git service"
EGIT_REPO_URI="https://github.com/go-gitea/gitea.git"
EGO_PN="code.gitea.io/gitea"
EGO_SRC="github.com/go-gitea/gitea"
HOMEPAGE="https://gitea.io"
IUSE="pam sqlite"
KEYWORDS="~amd64 ~arm ~arm64"
LICENSE="MIT"
SLOT="0"
COMMON_DEPEND="pam? ( sys-libs/pam )"
DEPEND="${COMMON_DEPEND}
	dev-go/go-bindata"
RDEPEND="${COMMON_DEPEND}
	dev-vcs/git"
