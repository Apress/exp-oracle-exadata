set sqlblanklines on
set serveroutput on
set feedback off
accept owner -
 prompt 'Enter Value for owner: ' -
 default 'KSO'
accept table_name -
 prompt 'Enter Value for table_name: ' -
 default 'SKEW'
accept comp_type -
 prompt 'Enter Value for compression_type (QL|QH|AL|AH): ' -
 default 'QH'

DECLARE

   l_blkcnt_cmp     BINARY_INTEGER;
   l_blkcnt_uncmp   BINARY_INTEGER;
   l_row_cmp        BINARY_INTEGER;
   l_row_uncmp      BINARY_INTEGER;
   l_cmp_ratio      NUMBER;
   l_comptype_str   VARCHAR2 (200);
   l_comptype       NUMBER;
BEGIN

  case '&&comp_type'
    when 'QL' then l_comptype := DBMS_COMPRESSION.COMP_QUERY_LOW;
    when 'QH' then l_comptype := DBMS_COMPRESSION.COMP_QUERY_HIGH;
    when 'AL' then l_comptype := DBMS_COMPRESSION.COMP_ARCHIVE_LOW;
    when 'AH' then l_comptype := DBMS_COMPRESSION.COMP_ARCHIVE_HIGH;
    else raise_application_error(-20001, 'unknown compression type-specify one of QL|QH|AL|AH');
  end case;

  DBMS_COMPRESSION.get_compression_ratio (
     scratchtbsname   => 'USERS',
     ownname          => '&owner',
     objname          => '&table_name',
     subobjname       => NULL,
     comptype         => l_comptype,
     blkcnt_cmp       => l_blkcnt_cmp,
     blkcnt_uncmp     => l_blkcnt_uncmp,
     row_cmp          => l_row_cmp,
     row_uncmp        => l_row_uncmp,
     cmp_ratio        => l_cmp_ratio,
     comptype_str     => l_comptype_str
  );

  dbms_output.put_line(' ');
  dbms_output.put_line(' ');
  dbms_output.put_line(' ');
  dbms_output.put_line(' ');
  DBMS_OUTPUT.put_line ('Estimated Compression Ratio using '||l_comptype_str||': '|| round(l_cmp_ratio,3));
  dbms_output.put_line(' ');

END;
/
undef owner
undef table_name
undef comp_type
set feedback on
