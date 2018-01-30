
set lines 150
col value for a145

select value from v$diag_info where name = 'Default Trace File';
