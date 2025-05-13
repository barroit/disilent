#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

src=$1
dst=$2

year=$(jq -r '."fileHeaderComment.parameter"."*".year' .vscode/settings.json)

cat <<EOF > $dst
/**
 * SPDX-License-Identifier: GPL-3.0-or-later
 *
 * Copyright $year Jiamu Sun <barroit@linux.com>
 *
 * @name $(cat NAME)
 * @author $(git config user.name)
 * @description Hides annoying users.
 * @version $(cat VERSION)
 */

EOF

cat $src >> $dst
