# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_PN=${PN,,}

DESCRIPTION="Common files shared by hipBLAS and hipBLASLt"
HOMEPAGE="https://github.com/ROCm/rocm-libraries/tree/rocm-7.1.0/projects/hipblas-common"
SRC_URI="https://github.com/ROCm/rocm-libraries/releases/download/therock-${PV}/${MY_PN}.tar.gz  -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0/$(ver_cut 1-2)"

BDEPEND="dev-build/rocm-cmake"
