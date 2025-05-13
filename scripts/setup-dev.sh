# SPDX-License-Identifier: GPL-3.0-or-later

script_path=$(perl -e 'use Cwd "abs_path"; print abs_path(shift); "\n"' $0)
script_root=$(dirname $script_path)

name=disilent.plugin.js
src=$script_root/../build/$name
dst=~/.config/BetterDiscord/plugins/$name

ln -sf $src $dst
