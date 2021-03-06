EAPI="5"

inherit unpacker eutils

DESCRIPTION="A tool for building and distributing virtual machines using VirtualBox"
HOMEPAGE="http://vagrantup.com/"
SRC_URI="
        amd64? (
			 https://releases.hashicorp.com/vagrant/${PV}/vagrant_${PV}_x86_64.deb
        )
        x86? (
			 https://releases.hashicorp.com/vagrant/${PV}/vagrant_${PV}_i686.deb
        )"

KEYWORDS="amd64 x86"
SLOT="0"
RESTRICT="mirror strip splitdebug test"
QA_PREBUILT="*"
S=${WORKDIR}

src_install() {
              insinto /opt
              insopts ""
              doins -r opt/vagrant
              dobin usr/bin/vagrant
}
