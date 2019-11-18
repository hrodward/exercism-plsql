create or replace package year#
is
  function is_leap (in_year pls_integer) return varchar2;
end year#;
/
create or replace package body year#
is
  function is_leap (in_year pls_integer) return varchar2 is
    is_leap boolean;
  begin
    is_leap := 
      case
        when mod(in_year, 100) = 0 then mod(in_year, 400) = 0
        else mod(in_year, 4) = 0
       end;
       
    return
      case is_leap
        when true then 'Yes, ' || in_year || ' is a leap year'
        else 'No, ' || in_year || ' is not a leap year'
      end;
  end;
end year#;
/