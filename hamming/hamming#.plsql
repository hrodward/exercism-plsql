create or replace package hamming#
is
  --+--------------------------------------------------------------------------+
  -- Computes the Hamming distance between two starnds.
  --
  -- @param i_first  sequence to compare
  -- @param i_second sequence to compare
  --
  -- @return         Hamming distance between i_first and i_second
  --+--------------------------------------------------------------------------+
  function distance (i_first varchar2 ,i_second varchar2) return pls_integer;
end hamming#;
/
create or replace package body hamming#
is
  function distance (i_first varchar2, i_second varchar2) return pls_integer is
    distance pls_integer := 0;
  begin
    -- dbms_output.put_line('i_first = ' || i_first || ', i_second=' || i_second);
    for i in 1 .. length(i_first) loop
      -- dbms_output.put_line('compare ' || substr(i_first, i, 1) || ' with ' || substr(i_second, i, 1));
      if substr(i_first, i, 1) != substr(i_second, i, 1) then
        distance := distance + 1;
      end if;
    end loop;
    -- dbms_output.put_line('  distance = ' || distance);
    return distance;
  end;
end hamming#;
/