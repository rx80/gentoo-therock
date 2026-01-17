# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Library that provides ROCm release version and install path information"
HOMEPAGE="https://github.com/ROCm/rocm-systems/tree/develop/projects/rocm-core"
SRC_URI="https://github.com/ROCm/rocm-systems/releases/download/therock-${PV}/rocm-core.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}"
KEYWORDS="~amd64"

RDEPEND="!<dev-util/hip-7.0"

LICENSE="MIT"
SLOT="0/$(ver_cut 1-2)"

src_configure() {
		# NOTE: Fails in utils.cmake:108 for versions like 7.10 that do not contain a patch number
		local mycmakeargs=( -DROCM_VERSION=7.10.0 )
		cmake_src_configure
}

src_install() {
		cmake_src_install
		# too broad for standard directory
		rm "${ED}"/usr/.info/version || die
}
