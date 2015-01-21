#!/bin/bash

# datefilter=$1
# filter="^$(date --date="$1" +"%b %_d")"
# grep "$filter" /var/log/auth.log
# exit 0
GEOIP_BIN=~cinsk/src/geoip/geoip

grep sshd /var/log/auth.log | egrep "(Failed|Invalid)" | \
    awk -f <(cat - <<-'EOD'
{
	if (match($0, /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/, m)) {
		badass[m[0]] += 1
	}
}

END {
	for (f in badass) {
		printf "%s %d\n", f, badass[f]
		#cmd = ("geoip " f)
		#printf "cmd: |%s|\n", cmd
		#cmd |& getline result
		#printf "  result: %s\n", result
	}
}
EOD
            ) | sort -k 2 -g -r | while IFS=", " read ip tries; do
                                      from=$($GEOIP_BIN $ip)
                                      #from=""
                                      printf "%4d %15s %s\n" "$tries" "$ip" "$from"
done
