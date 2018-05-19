ARG BUILD_FROM=hassioaddons/base-amd64:1.4.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Setup base
RUN \
    apk add --no-cache \
        freetype=2.8.1-r2 \
        libffi=3.2.1-r4 \
        libxml2=2.9.7-r0 \
        libxslt=1.1.31-r0 \
        nodejs-npm=8.9.3-r1 \
        nodejs=8.9.3-r1 \
        openblas=0.2.19-r3 \
        openssl=1.0.2o-r0 \
        py-cycler@edge=0.10.0-r0 \
        py-numpy-dev@edge=1.14.3-r0 \
        py-twisted=17.1.0-r0 \
        py-w3lib@edge=1.15.0-r0 \
        py3-asn1crypto=0.23.0-r0 \
        py3-attrs@edge=17.4.0-r1 \
        py3-cffi=1.10.0-r0 \
        py3-cryptography=2.0.3-r1 \
        py3-cssselect@edge=1.0.0-r1 \
        py3-dateutil=2.6.1-r0 \
        py3-decorator@edge=4.3.0-r0 \
        py3-dispatcher@edge=2.0.5-r2 \
        py3-influxdb@edge=4.1.1-r0 \
        py3-jedi@edge=0.12.0-r0 \
        py3-jsonschema=2.6.0-r0 \
        py3-lxml=4.1.1-r0 \
        py3-markupsafe=1.0-r0 \
        py3-numpy@edge=1.14.3-r0 \
        py3-openssl@edge=17.2.0-r0 \
        py3-packaging@edge=17.1-r0 \
        py3-pexpect@edge=4.5-r0 \
        py3-pillow=4.3.0-r0 \
        py3-ptyprocess=0.5.2-r0 \
        py3-pygments=2.2.0-r0 \
        py3-queuelib@edge=1.4.2-r3 \
        py3-requests@edge=2.18.4-r0 \
        py3-scipy@edge=1.0.1-r0 \
        py3-six=1.11.0-r0 \
        py3-sqlalchemy@edge=1.2.7-r0 \
        py3-tornado=4.5.2-r1 \
        py3-tz@edge=2018.3-r0 \
        py3-wcwidth=0.1.7-r0 \
        py3-yaml=3.12-r1 \
        py3-zmq@edge=17.0.0-r0 \
        python3=3.6.3-r9 \
        yarn@edge=1.6.0-r0 \
        zeromq=4.2.2-r2 \
    \
    && pip3 install --no-cache-dir --upgrade \
        pip==10.0.1 \
        setuptools==39.1.0 \
        wheel==0.31.1 \
    \
    && apk add --no-cache --virtual .build-dependencies \
        freetype-dev=2.8.1-r2 \
        g++=6.4.0-r5 \
        gcc=6.4.0-r5 \
        make=4.2.1-r0 \
        musl-dev=1.1.18-r3 \
        openblas-dev=0.2.19-r3 \
        openssl-dev=1.0.2o-r0 \
        python3-dev=3.6.3-r9 \
    \
    && pip3 install --no-cache-dir \
        bash_kernel==0.7.1 \
        beautifulsoup4==4.6.0 \
        bokeh==0.12.16 \
        geopy==1.14.0 \
        homeassistant==0.69.1 \
        ipykernel==4.8.2 \
        ipython==6.4.0 \
        ipywidgets==7.2.1 \
        jinja2==2.10 \
        jupyter_client==5.2.3 \
        jupyter_core==4.4.0 \
        jupyterlab_github==0.6.0 \
        jupyterlab==0.32.1 \
        matplotlib==2.2.2 \
        nbconvert==5.3.1 \
        notebook==5.5.0 \
        pandas==0.23.0 \
        plotly==2.6.0 \
        PyMySQL==0.8.1 \
        scikit-learn==0.19.1 \
        scrapy==1.5.0 \
        seaborn==0.8.1 \
        statsmodels==0.9.0 \
        xlrd==1.1.0 \
    \
    && jupyter labextension install jupyterlab_bokeh \
    && jupyter labextension install @jupyterlab/github \
    && apk del --purge .build-dependencies \
    && apk del --purge py-numpy-dev \
    && rm -rf \
        /root/.cache \
    && find /usr/lib/python3.6/ -type d -name tests -depth -exec rm -rf {} \; \
        && find /usr/lib/python3.6/ -type d -name test -depth -exec rm -rf {} \; \
        && find /usr/lib/python3.6/ -name __pycache__ -depth -exec rm -rf {} \;

# Copy root filesystem
COPY rootfs /

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Jupyter" \
    io.hass.description="Create and share documents that contain live code, equations, visualizations, and explanatory text directly in your browser" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.label-schema.description="Create and share documents that contain live code, equations, visualizations, and explanatory text directly in your browser" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Jupyter" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://addons.community" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-jupyter/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-jupyter" \
    org.label-schema.vendor="Community Hass.io Add-ons"
