EAPI="5"

inherit unpacker eutils

DESCRIPTION="Omnibus package for chef-client"
HOMEPAGE="https://downloads.chef.io/chef-client/"
SRC_URI="
        amd64? (
               https://packages.chef.io/files/stable/chef/${PV}/ubuntu/16.04/chef_${PV}-1_amd64.deb
        )
        x86? (
             https://packages.chef.io/files/stable/chef/${PV}/ubuntu/16.04/chef_${PV}-1_i386.deb
        )
"

KEYWORDS="amd64 x86"
SLOT="0"
RESTRICT="mirror strip splitdebug test"
QA_PREBUILT="*"
S=${WORKDIR}

src_install() {
              insinto /opt
              insopts ""
              doins -r opt/chef
              dosym /opt/chef/bin/chef-client /usr/bin/chef-client
              dosym /opt/chef/bin/chef-solo   /usr/bin/chef-solo
              dosym /opt/chef/bin/chef-apply  /usr/bin/chef-apply
              dosym /opt/chef/bin/ohai        /usr/bin/ohai
              dosym /opt/chef/bin/chef-shell  /usr/bin/chef-shell
              dosym /opt/chef/bin/knife       /usr/bin/knife
}