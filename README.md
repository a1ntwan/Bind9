These are 4 different variations of BIND9 deployment represented at each branch:

1. **DNS resolver** - a server that resolves all client queries and caches the results, has no zone authority;
2. **Geoip DNS** - a server that has different zone files for the same zone based on client geolocation;
3. **Master+slaves** - just simple BIND9 master and two slave nodes;
4. **DNS+DHCP** - same master-slaves configuration, but with primary-secondary DHCP on 2 nodes.

These playbooks are tested and valid for both **RHEL** and **Debian** based distros, though some distros may predictably cause some sort of trouble. 

Don't forget to check **README+.md** (on other branches) for variation specific details. Good luck!
