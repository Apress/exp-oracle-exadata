set line 150
col username for a15
SELECT s.username, s.user#, s.sid, s.serial#, s.prev_hash_value, schemaname, p.spid os_pid, p.stid
 FROM V$SESSION S, v$process p
 WHERE audsid = SYS_CONTEXT('userenv','sessionid')
and p.addr = s.paddr
 and s.username is not null
/
