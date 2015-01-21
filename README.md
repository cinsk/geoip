
geoip
=====

`geoip` is a simple server/client tool for get the country information of given IP address.  Currently, it only supports IPv4.

Usage
-----

You need to start the server before querying.

        $ ./geoip start

Please, wait for a while, since loading all data takes some times.  On my Gentoo Linux system(i7 3.5GHz), it takes 13 second(s) to load the database.

After the server started, you can query IP address like this:

        $ ./geoip 117.21.191.207
        China

Run `geoip stop` if you want to stop the server.

        $ ./geoip stop


Update & Build
--------------

Downloads CSV database(`GeoIPCountryCSV.zip`) from [maxmind](http://dev.maxmind.com/geoip/legacy/geolite/), and unzip it, then rename the database as `data`.   Finally, just do `make`.


Misc
----

The companion script, `badass-ssh.sh` will give you the summary of failed SSH attempts to your server.  Each line has the form of "NNN ADDRESS COUNTRY" where NNN is the count of the attempts.  For example:

        $ sudo ./badass-ssh.sh | head
         190  117.21.191.207 China
         117   82.165.154.23 Germany
         117 122.225.109.102 China
         116 122.225.109.200 China
         115 122.225.109.203 China
         114 122.225.109.195 China
         113   61.183.22.139 China
         113   110.76.39.140 Korea, Republic of
         112   87.106.78.206 Germany
         111 122.225.109.215 China

You'll need to modify `badass-ssh.sh` for the pathname of `geoip` script.
