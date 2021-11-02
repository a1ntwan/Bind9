#!/bin/bash

[ -f GeoIPCountryCSV.zip ] || wget -T 5 -t 1 https://files-cdn.liferay.com/mirrors/geolite.maxmind.com/download/geoip/database/GeoIPCountryCSV.zip

echo -n "Creating CBE (Country,Begin,End) CSV file..."
unzip -p GeoIPCountryCSV.zip GeoIPCountryWhois.csv | awk -F \" '{print $10","$6","$8}' > cbe.csv
echo -ne "DONE\nGenerating BIND GeoIP.acl file..."

(for c in $(awk -F , '{print $1}' cbe.csv | sort -u)
do
  echo "acl $c {"
  grep "^$c," cbe.csv | awk -F , 'function s(b,e,l,m,n) {l = int(log(e-b+1)/log(2)); m = 2^32-2^l; n = and(m,e); if (n == and(m,b)) printf "\t%u.%u.%u.%u/%u;\n",b/2^24%256,b/2^16%256,b/2^8%256,b%256,32-l; else {s(b,n-1); s(n,e)}} s($2,$3)'
  echo -e "};\n"
done) > GeoIP.acl

rm -f cbe.csv
echo "DONE"

exit 0
