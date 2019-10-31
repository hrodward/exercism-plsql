create or replace package numeral#
is
  
  function to_roman(input in pls_integer) return varchar2;
  function to_roman(remaining in pls_integer, numeral in varchar2) return varchar2;

end numeral#;
/

create or replace package body numeral#
is
  
  function to_roman(input in pls_integer) return varchar2 is
  begin
    if input < 0 or input > 3000 then
      raise invalid_number;
    end if;    
    return to_roman(input, '');
  end;
  
  
  function to_roman(remaining in pls_integer, numeral in varchar2) return varchar2 is
  begin
    return
      case
        when remaining >= 1000 then to_roman(remaining - 1000, numeral ||  'M')
        when remaining >=  900 then to_roman(remaining -  900, numeral || 'CM')
        when remaining >=  500 then to_roman(remaining -  500, numeral ||  'D')
        when remaining >=  400 then to_roman(remaining -  400, numeral || 'CD')
        when remaining >=  100 then to_roman(remaining -  100, numeral ||  'C')
        when remaining >=   90 then to_roman(remaining -   90, numeral || 'XC')
        when remaining >=   50 then to_roman(remaining -   50, numeral ||  'L')
        when remaining >=   40 then to_roman(remaining -   40, numeral || 'XL')
        when remaining >=   10 then to_roman(remaining -   10, numeral ||  'X')
        when remaining >=    9 then to_roman(remaining -    9, numeral || 'IX')
        when remaining >=    5 then to_roman(remaining -    5, numeral ||  'V')
        when remaining >=    4 then to_roman(remaining -    4, numeral || 'IV')
        when remaining >=    1 then to_roman(remaining -    1, numeral ||  'I')
        else numeral
      end;
  exception when others then raise;
  end;
  
end numeral#;
/
