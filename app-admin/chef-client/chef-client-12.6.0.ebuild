EAPI="5"

inherit unpacker eutils

DESCRIPTION="Omnibus package for chef-client"
HOMEPAGE="https://downloads.chef.io/chef-client/"
SRC_URI="
        amd64? (
               https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/10.04/x86_64/chef_${PV}-1_amd64.deb
        )
        x86? (
             https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/10.04/i686/chef_${PV}-1_i386.deb
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
              dosym /opt/chef-client/bin/chef-client /usr/bin/chef-client
              dosym /opt/chef-client/bin/chef-solo   /usr/bin/chef-solo
              dosym /opt/chef-client/bin/chef-apply  /usr/bin/chef-apply
              dosym /opt/chef-client/bin/ohai        /usr/bin/ohai
              dosym /opt/chef-client/bin/chef-shell  /usr/bin/chef-shell
              dosym /opt/chef-client/bin/knife       /usr/bin/knife
}