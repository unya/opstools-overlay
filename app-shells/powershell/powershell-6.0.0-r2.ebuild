EAPI="5"

inherit unpacker eutils
ALPHA="-rc.2"
POWERSHELL_VERSION="${PV}${ALPHA}"
DESCRIPTION="Open Source PowerShell, from Ubuntu package"
HOMEPAGE="https://github.com/PowerShell/PowerShell"
SRC_URI="https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-rc.2/powershell_6.0.0-rc.2-1.ubuntu.16.04_amd64.deb"
# SRC_URI="https://github.com/PowerShell/PowerShell/releases/download/v${POWERSHELL_VERSION}/powershell_${POWERSHELL_VERSION}-1ubuntu1.14.04.1_amd64.deb"

KEYWORDS="amd64"
SLOT="0"
RESTRICT="mirror strip splitdebug test"
QA_PREBUILT="*"
S=${WORKDIR}

src_install() {
              insinto /opt
              insopts ""
              doins -r opt/microsoft
              dosym /opt/microsoft/powershell/${POWERSHELL_VERSION}/powershell /usr/bin/powershell
              doman usr/local/share/man/man1/powershell.1.gz
              dodoc usr/share/doc/powershell/changelog.gz
}