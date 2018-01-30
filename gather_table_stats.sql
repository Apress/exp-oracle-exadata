begin
  dbms_stats.gather_table_stats(
     '&owner','&table_name',
     method_opt       => '&method_opt'
   );
end;
/
