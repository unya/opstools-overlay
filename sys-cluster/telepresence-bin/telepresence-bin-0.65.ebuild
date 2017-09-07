# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker 


DESCRIPTION="Telepresence tool for k8s"
HOMEPAGE="http://www.telepresence.io/"

MY_PN="${PN/-bin/}"
BASE_URI="https://packagecloud.io/datawireio/telepresence/ubuntu/pool/xenial/main/t/telepresence/${MY_PN}_${PV}_${ARCH}.deb"
SRC_URI="${BASE_URI}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	doins -r usr/share/doc/${MY_PN}/*
	dobin usr/bin/sshuttle-telepresence
	dobin usr/bin/telepresence
}

