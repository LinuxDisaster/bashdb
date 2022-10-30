#
# Regular cron jobs for the bashdb package
#
0 4	* * *	root	[ -x /usr/bin/bashdb_maintenance ] && /usr/bin/bashdb_maintenance
