#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Jupyter
# Ensures the Jupyter notebooks directory exists
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

if ! hass.directory_exists '/config/notebooks'; then
    mkdir -p /config/notebooks \
        || hass.die 'Failed creating notebooks directory'
fi
