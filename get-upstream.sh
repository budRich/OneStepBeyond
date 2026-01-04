#!/bin/bash

# for v in 0.993 0.994 0.995 0.996 0.997 ; do ./get-upstream.sh "$v" ; done

upstream_branch=auto
upstream_version=${1:-0.997}
zip_file="OneStepBack-v${upstream_version}.zip"
url=http://www.vide.memoire.free.fr/pages/onestepback/"$zip_file"
git checkout "$upstream_branch" || exit 1
[[ -f $zip_file ]] || wget "$url"

[[ -d OneStepBack ]] && rm -rf OneStepBack/
[[ -d theme ]] && rm -rf theme/
unzip "$zip_file"
mv OneStepBack theme
mv -f theme/gtk-3.0/gtk.css src/OneStepBack.css

git add .
git commit -m "Pulled Upstream v${upstream_version}"
git checkout -
