set serveroutput on

DECLARE
  miops PLS_INTEGER;
  mmbps PLS_INTEGER;
  alat  NUMBER;
BEGIN

  dbms_resource_manager.calibrate_io (
    num_physical_disks => &no_of_disks,
    max_latency        => 10,
    max_iops           => miops,
    max_mbps           => mmbps,
    actual_latency     => alat
  ); 
 
  dbms_output.put_line('max_iops = ' || miops);
  dbms_output.put_line('max_mbps = ' || mmbps);
  dbms_output.put_line('latency  = ' || alat);
end;
/
