create or replace package raindrops#
is
  type rain_dictionary_type is table of varchar2(5) index by pls_integer;
  
  function convert(raincode in pls_integer) return varchar2;

end raindrops#;
/


create or replace package body raindrops#
is

  function convert(rainCode in pls_integer) return varchar2 is
    rain_dictionary rain_dictionary_type;
    rain varchar2(250);
    idx pls_integer := 3;
  begin
    rain_dictionary(3) := 'Pling';
    rain_dictionary(5) := 'Plang';
    rain_dictionary(7) := 'Plong';  
    
    while idx <= 7 loop
      if mod(rainCode, idx) = 0 then
        rain := rain || rain_dictionary(idx);
      end if;
      idx := idx + 2;      
    end loop;
  
    if rain is null then
      return rainCode;
    else
      return rain;
    end if;
    
  exception when others then raise;
  end;
  
end raindrops#;
/
