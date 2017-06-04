# Copyright 2017 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
include (ExternalProject)

set(MKL_URL https://github.com/01org/mkl-dnn/releases/download/v0.9/mklml_win_2018.0.20170425.zip)
set(MKL_DIR ${CMAKE_CURRENT_BINARY_DIR}/mkl/src/mkl)
set(MKL_INSTALL ${tensorflow_source_dir}/third_party/mkl)

# download mkl, copy to third_party/mkl
ExternalProject_Add(mkl
    PREFIX mkl
    URL ${MKL_URL}
    DOWNLOAD_DIR "${DOWNLOAD_LOCATION}"
    CONFIGURE_COMMAND ""
    BUILD_IN_SOURCE 0
    BUILD_COMMAND ${CMAKE_COMMAND} -E copy_directory ${MKL_DIR} ${MKL_INSTALL}
    INSTALL_COMMAND ${CMAKE_COMMAND} -E copy ${MKL_INSTALL}/lib/mklml.dll ${MKL_INSTALL}/lib/libiomp5md.dll
        ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_BUILD_TYPE}
)
