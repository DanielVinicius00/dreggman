# duckstation-0.1.1234.ebuild

EAPI=8

DESCRIPTION="Fast PlayStation 1 emulator for PC"
HOMEPAGE="https://github.com/stenzek/duckstation"
SRC_URI="https://github.com/DanielVinicius00/dreggman/raw/main/pkgs/duckstation-0.1.tar.gz -> ${P}.tar.gz"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt5 qt6"

DEPEND="
    dev-libs/expat
    media-libs/libsdl2
    media-libs/libpng
    x11-libs/libX11
    qt5? ( dev-qt/qtbase:5 )
    qt6? ( dev-qt/qtbase:6 )
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${PV}"

src_configure() {
    local mycmakeargs=(
        -DDUCKSTATION_QT5=$(usex qt5 ON OFF)
        -DDUCKSTATION_QT6=$(usex qt6 ON OFF)
    )

    cmake_src_configure
}

src_install() {
    cmake_src_install

    # Coloca um symlink para facilitar executar pelo terminal
    dosym /usr/bin/duckstation-nogui /usr/bin/duckstation
}
