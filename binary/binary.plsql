create or replace package binary#
is
  function to_decimal (in_binary varchar2) return pls_integer;
end binary#;
/
create or replace package body binary#
is

  function to_decimal (in_binary in varchar2) return pls_integer is
    out_decimal pls_integer := 0;
    temp_binary varchar2(200) := in_binary;
    regexp varchar2(200);
  begin
  
    regexp := regexp_substr(in_binary, '[01]*');
    if regexp is null or regexp != in_binary then
      return 0;
    end if;
    
    for idx in 0 .. length(in_binary) - 1 loop
      out_decimal := out_decimal + power(2, idx) * to_number(substr(temp_binary, length(temp_binary)));
      temp_binary := substr(temp_binary, 1, length(temp_binary) - 1);
    end loop;
    return out_decimal;
    
  end;
  
end binary#;
/