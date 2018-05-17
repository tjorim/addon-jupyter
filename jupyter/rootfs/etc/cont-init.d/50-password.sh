#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Jupyter
# This files check if all user configuration requirements are met
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

# Basic idea on setting a password
#password=$(python3 -c "from notebook.auth.security import passwd;print(passwd('test'))")
#c.NotebookApp.password = u'%s'" % (pwhash)

