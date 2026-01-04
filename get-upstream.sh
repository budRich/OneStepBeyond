#!/bin/bash

# for v in 0.993 0.994 0.995 0.996 0.997 ; do ./get-upstream.sh "$v" ; done

upstream_version=${1:-0.997}
zip_file="OneStepBack-v${upstream_version}.zip"
url=http://www.vide.memoire.free.fr/pages/onestepback/"$zip_file"
git checkout upstream || exit 1
wget "$url"

[[ -d OneStepBack ]] && rm -rf OneStepBack/
unzip "$zip_file"

git add OneStepBack
git commit -m "Pulled Upstream v${upstream_version}"
git checkout -
