#!/bin/bash
# Since: January, 2021
# Author: gvenzl
# Name: build_Dockerfile_11202.sh
# Description: Build test scripts for Oracle DB XE 11.2.0.2
#
# Copyright 2021 Gerald Venzl
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

# Exit on errors
# Great explanation on https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -Eeuo pipefail

CURRENT_DIR=${PWD}

cd ../

echo "TEST: Building 11.2.0.2 FULL image"
./buildContainerImage.sh -v 11.2.0.2 -f
echo "DONE: Building 11.2.0.2 FULL image"

echo "TEST: Building 11.2.0.2 REGULAR image"
./buildContainerImage.sh -v 11.2.0.2
echo "DONE: Building 11.2.0.2 REGULAR image"

echo "TEST: Building 11.2.0.2 SLIM image"
./buildContainerImage.sh -v 11.2.0.2 -s
echo "TEST: Building 11.2.0.2 SLIM image"

cd "${CURRENT_DIR}"
