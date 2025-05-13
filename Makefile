# SPDX-License-Identifier: GPL-3.0-or-later

plugin_root := $(shell cat .pluginroot)

.PHONY: build reload

reload:

build:
	@esbuild --log-level=error --platform=node \
		 --bundle --outfile=build/tmp disilent.js

	@scripts/add-meta.sh build/tmp build/disilent.plugin.js

reload: build
	@cd $(plugin_root) && \
	 mv disilent.plugin.js .. && sleep 1 && mv ../disilent.plugin.js .
