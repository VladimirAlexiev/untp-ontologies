# https://test.uncefact.org/vocabulary/untp/home lists currently available ontologies
# https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/#specifications lists more, but some are in development and not yet available at URLs like these listed above

all: core.jsonld dpp.jsonld dcc.jsonld dfr.jsonld dte.jsonld dia.jsonld \
  core.ttl dpp.ttl dcc.ttl dfr.ttl dte.ttl dia.ttl \
  duplicate-terms.txt

# get JSON-LD
%.jsonld:
	curl -Haccept:application/ld+json https://test.uncefact.org/vocabulary/untp/$*/0/ > $@

# convert to Turtle
%.ttl: %.jsonld
	riot.bat --out ttl $^ > temp.ttl
	owl.bat write --useCommaByDefault temp.ttl $@
	rm temp.ttl

duplicate-terms.txt::
	perl -ne 'print if s{^un.*?:(.*? ).*}{^un.*:$$1}' *.ttl | sort | uniq -d > temp.txt
	grep -hof temp.txt *.ttl |sort -t: -k2 > $@
	rm temp.txt