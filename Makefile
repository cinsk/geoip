

.PHONY: all clean rebuild


all: geoip
rebuild: clean all

geoip: geoip-skel data.gz
	cat geoip-skel data.gz > geoip
	chmod +x geoip

data.gz: data
	gzip -9 -c data > data.gz

clean:
	rm -f data.gz
	rm -f geoip
