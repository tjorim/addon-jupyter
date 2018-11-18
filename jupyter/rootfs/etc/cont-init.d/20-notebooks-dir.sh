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

    git clone -b master --single-branch \
        https://github.com/home-assistant/home-assistant-notebooks.git \
        /config/notebooks/home-assistant \
            || hass.die 'Failed installing Home Assistant example notebooks'

    git clone -b master --single-branch --depth 1 \
        https://github.com/bokeh/bokeh-notebooks.git \
        /config/notebooks/bokeh-examples \
            || hass.die 'Failed installing Bokeh example notebooks'

    git clone -b master --single-branch --depth 1 \
        https://github.com/glouppe/tutorial-sklearn-lhcb \
        /config/notebooks/tutorial-sklearn \
            || hass.die 'Failed installing sklearn tutorial notebooks'

    git clone -b master --single-branch --depth 1 \
        https://bitbucket.org/hrojas/learn-pandas.git \
        /config/notebooks/learn-pandas \
            || hass.die 'Failed installing learn pandas notebooks'
fi
