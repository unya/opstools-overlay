# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools ltprune

DESCRIPTION="A domain specific configuration language that helps you define JSON data."
HOMEPAGE="http://jsonnet.org/"
SRC_URI="https://github.com/google/jsonnet/archive/v${PV}.tar.gz"
# https://github.com/google/jsonnet/archive/v0.9.5.tar.gz
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
"
RDEPEND="
"
src_compile() {
	make -j1 jsonnet
}
src_install() {
	dobin jsonnet
}
