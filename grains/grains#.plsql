create or replace package grains#
is
  function at_square (in_square number) return number;
  function total return number;
end grains#;
/
create or replace package body grains#
is
  function at_square (in_square number) return number is
    grains number := 0;
  begin
    return power(2, in_square - 1);
  end;
  
  function total(in_square number, in_out_sum number) return number is
  begin
    if in_square = 0 then
      return in_out_sum;
    else
      return total(in_square-1, in_out_sum + at_square(in_square));
    end if;
  end;
  
  function total return number is
    res number := 0;
  begin
    return total(64, 0);
  end;
  
end grains#;
/