select name from v$event_name
where name like nvl('&event_name',name)
order by 1
/
