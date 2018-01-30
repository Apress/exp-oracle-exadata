set lines 150
select con_id, owner, table_name, status, last_analyzed, num_rows, blocks, degree
from cdb_tables
where con_id in (select con_id from v$pdbs where name like nvl('&pdb_name', name))
and owner like nvl('&owner',owner)
and table_name like nvl('&table_name',table_name)
order by con_id, owner, table_name
/ 
