# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/go-gitea/gitea.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
src_prepare() {
    default
    sed -i \
        -e "s#^RUN_MODE = dev#RUN_MODE = prod#"                                     \
        -e "s#^ROOT =#ROOT = ${EPREFIX}/var/lib/gitea/gitea-repositories#"          \
        -e "s#^ROOT_PATH =#ROOT_PATH = ${EPREFIX}/var/log/gitea#"                   \
        -e "s#^APP_DATA_PATH = data#APP_DATA_PATH = ${EPREFIX}/var/lib/gitea/data#" \
        -e "s#^HTTP_ADDR = 0.0.0.0#HTTP_ADDR = 127.0.0.1#"                          \
        -e "s#^MODE = console#MODE = file#"                                         \
        -e "s#^LEVEL = Trace#LEVEL = Info#"                                         \
        -e "s#^LOG_SQL = true#LOG_SQL = false#"                                     \
        -e "s#^DISABLE_ROUTER_LOG = false#DISABLE_ROUTER_LOG = true#"               \
        -e "s#^APP_ID =#;APP_ID =#"                                                 \
        -e "s#^TRUSTED_FACETS =#;TRUSTED_FACETS =#"                                 \
        custom/conf/app.ini.sample || die
    gitea_make generate
}
