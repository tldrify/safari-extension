.PHONY: build
SHELL := /bin/bash

XAR = /usr/local/bin/xar
CERT_DIR = certs
EXTENSION = tldrify

build:
	$(XAR) -czf $(EXTENSION).safariextz --distribution $(EXTENSION).safariextension
	$(XAR) --sign -f $(EXTENSION).safariextz --digestinfo-to-sign digest.dat --sig-size `cat $(CERT_DIR)/size.txt` --cert-loc $(CERT_DIR)/cert.der --cert-loc $(CERT_DIR)/cert01 --cert-loc $(CERT_DIR)/cert02
	openssl rsautl -sign -inkey $(CERT_DIR)/key.pem -in digest.dat -out sig.dat
	$(XAR) --inject-sig sig.dat -f $(EXTENSION).safariextz
	rm -f sig.dat digest.dat
