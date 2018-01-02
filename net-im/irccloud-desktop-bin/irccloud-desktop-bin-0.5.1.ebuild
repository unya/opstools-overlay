# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker gnome2-utils

QA_PREBUILT="
	opt/IRCCloud/IRCCloud
	opt/IRCCloud/libnode.so
  opt/IRCCloud/libffmpeg.so
  "

DESCRIPTION="IRCCloud desktop app"
HOMEPAGE="http://www.irccloud.com/"

MY_PN="${PN/-bin/}"
BASE_URI="https://github.com/irccloud/irccloud-desktop/releases/download/v${PV}/${MY_PN}_${PV}__arch_.deb"
# "https://github.com/irccloud/irccloud-desktop/releases/download/v0.5.1/irccloud-desktop_0.5.1_amd64.deb"
SRC_URI="
	amd64? ( ${BASE_URI/_arch_/amd64} )
"

LICENSE="MIT Apache-2.0 BSD ISC LGPL-2 AFL-2.1 public-domain WTFPL-2 Artistic-2 no-source-code"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

RDEPEND="x11-libs/gtk+:2
	x11-libs/libnotify
	x11-libs/libXtst
	x11-libs/pango
	x11-libs/cairo[xcb]
	media-libs/alsa-lib
	media-libs/harfbuzz[graphite]
	media-libs/libcanberra[gtk]
	dev-libs/nss
	dev-libs/glib:2
	dev-libs/atk
	gnome-base/libgnome-keyring
	gnome-base/gconf:2
	sys-apps/dbus
	net-print/cups[ssl]
	net-misc/curl
	virtual/udev
	virtual/libc
	virtual/libffi
"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

pkg_preinst() {
	gnome2_icon_savelist
}

src_install() {
	insinto /usr/share/pixmaps
	doins usr/share/pixmaps/${MY_PN}.png

	newicon -s 512 usr/share/pixmaps/${MY_PN}.png ${MY_PN}.png
	domenu usr/share/applications/${MY_PN}.desktop

	insinto /opt/${MY_PN}
	doins -r usr/lib/${MY_PN}/*
	fperms +x /opt/${MY_PN}/${MY_PN}
	dosym /opt/${MY_PN}/${MY_PN} /usr/bin/${MY_PN}
}

pkg_postinst() {
	gnome2_icon_cache_update
}
