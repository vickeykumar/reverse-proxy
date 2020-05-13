include Makefile.include
DEBIAN_ROOT = ${ROOT}/deb

.PHONY: deb
deb:	reverse-proxy.service
	@echo "bulding ROOT: "${ROOT}
	mkdir -p ${DEBIAN_ROOT}/reverse-proxy/usr/lib/systemd/system
	mkdir -p ${DEBIAN_ROOT}/reverse-proxy/opt/sish-lb/
	mkdir -p ${DEBIAN_ROOT}/reverse-proxy/opt/sish-lb/templates/
	mkdir -p ${DEBIAN_ROOT}/reverse-proxy/opt/sish-lb/keys/
	mkdir -p ${DEBIAN_ROOT}/reverse-proxy/opt/sish-lb/pubkeys/
	install -m 644 ${ROOT}/reverse-proxy.service ${DEBIAN_ROOT}/reverse-proxy/usr/lib/systemd/system/reverse-proxy.service
	cd ${DEBIAN_ROOT} && dpkg-deb --build reverse-proxy/
