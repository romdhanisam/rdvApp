#!/usr/bin/env bash
# Copyright 2017 The Kubernetes Authors.
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

# This script takes an argument: the tag name ("v1.2.3") to release from.

# Exit on error.
set -e

function test {
  if [ -n "$(git status --porcelain)" ]; then
    echo "Git working tree not clean, aborting."
    exit 1
  fi
  echo "test" > report.txt
  git add -A && git commit -m "Update report.txt file from CI"
}

# Execute script.
test