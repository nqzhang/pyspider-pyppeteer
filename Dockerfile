FROM fedora:29

RUN yum -y install git python36 libX11-xcb pango libXcomposite libXcursor libXdamage libXext libXi libXtst cups-libs libXScrnSaver libXrandr GConf2 alsa-lib atk gtk3 nss -y && yum -y install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6
RUN mkdir -p /opt/
WORKDIR /opt
RUN git clone https://github.com/nqzhang/pyspider-pyppeteer
WORKDIR /opt/pyspider-pyppeteer
RUN pip3.6 install -r requirements.txt
RUN rm -f /etc/machine-id &&  dbus-uuidgen --ensure=/etc/machine-id
EXPOSE 22224
VOLUME ["/opt/pyspider-pyppeteer"]
CMD ["python3.6", "pyppeteer_fetcher.py"]