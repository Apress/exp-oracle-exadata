col name for a70
col value for 99999999999999
select name, value
from v$mystat s, v$statname n
where n.statistic# = s.statistic#
and name = 'cell physical IO bytes saved by storage index';

col name clear
col value clear
