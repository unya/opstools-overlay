EAPI="5"

inherit unpacker eutils

DESCRIPTION="Omnibus package with all tools for Chef Workstation"
HOMEPAGE="https://downloads.chef.io/chef-dk/"
SRC_URI="https://packages.chef.io/stable/ubuntu/12.04/chefdk_${PV}-1_amd64.deb"

KEYWORDS="amd64"
SLOT="0"
RESTRICT="mirror strip splitdebug test"
QA_PREBUILT="*"
S=${WORKDIR}

src_install() {
              insinto /opt
              insopts ""
              doins -r opt/chefdk
              dosym /opt/chefdk/bin/chef /usr/bin/chef
}
