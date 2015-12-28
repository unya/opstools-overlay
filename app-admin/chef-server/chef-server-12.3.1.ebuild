EAPI="5"

inherit unpacker eutils

DESCRIPTION="Omnibus package for chef-server"
HOMEPAGE="https://downloads.chef.io/chef-server/"
SRC_URI="
        amd64? (
               https://packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_${PV}-1_amd64.deb/download -> chef-server-core_${PV}-1_amd64.deb
        )
"

KEYWORDS="amd64"
SLOT="0"
RESTRICT="mirror strip splitdebug test"
QA_PREBUILT="*"
S=${WORKDIR}

src_install() {
              insinto /opt
              insopts ""
              doins -r opt/opscode
              dosym /opt/chef-client/bin/chef-server-ctl /usr/bin/chef-server-ctl
              
}