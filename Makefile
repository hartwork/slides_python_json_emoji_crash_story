# Copyright (C) Sebastian Pipping <sebastian@pipping.org>
# Licensed under CC-BY-SA 4.0

PDF_FILE = python-json-emoji-crash-story-2020-02-18.pdf

IMAGES = \
	qrcodes/django_berlin_companies.png \
	qrcodes/django_cve_2019_19844.png \
	qrcodes/drf_issue_7026.png


.PHONY: pdf
pdf: $(PDF_FILE)

.PHONY: images
images: $(IMAGES)

.PHONY: clean
clean:
	rm -f $(PDF_FILE)
	rm -Rf qrcodes/

.PHONY: fonts-available
fonts-available:
	fc-list Metropolis, | grep -q .  # i.e. non-empty output

$(PDF_FILE): slides.pin $(IMAGES) fonts-available
	pinpoint -o $@ $<

qrcodes/django_berlin_companies.png: | qrcodes
	./render_qr_code.sh $@ 'https://github.com/hartwork/django-berlin#companies'

qrcodes/django_cve_2019_19844.png: | qrcodes
	./render_qr_code.sh $@ 'https://www.djangoproject.com/weblog/2019/dec/18/security-releases/'

qrcodes/drf_issue_7026.png: | qrcodes
	./render_qr_code.sh $@ 'https://github.com/encode/django-rest-framework/issues/7026'


qrcodes:
	mkdir qrcodes
