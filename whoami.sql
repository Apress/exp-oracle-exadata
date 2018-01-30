set line 132
col username for a15
col schemaname for a15
SELECT s.username, s.user#, s.sid, s.serial#, s.prev_hash_value, schemaname, p.spid os_pid
 FROM V$SESSION S, v$process p
 WHERE audsid = SYS_CONTEXT('userenv','sessionid')
and p.addr = s.paddr
 and s.username is not null
/
