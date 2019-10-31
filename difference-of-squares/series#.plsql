create or replace package series#
is
  
  function square_of_sums(input in pls_integer) return pls_integer;
  function sum_of_squares(input in pls_integer) return pls_integer;
  function diff_of_squares(input in pls_integer) return pls_integer;

end series#;
/

create or replace package body series#
is
  
  function diff_of_squares(input in pls_integer) return pls_integer is
  begin
  
    return square_of_sums(input) - sum_of_squares(input);
    
  exception when others then raise;
  end;
  

  function square_of_sums(input in pls_integer) return pls_integer is
    i_sum pls_integer := 1;
  begin
  
    for idx in 2 .. input loop
      i_sum := i_sum + idx;
    end loop;
    return power(i_sum, 2);
    
  exception when others then raise;
  end;
  
  
  function sum_of_squares(input in pls_integer) return pls_integer is
    i_sum pls_integer := 1;
  begin
  
    for idx in 2 .. input loop
      i_sum := i_sum + power(idx, 2);
    end loop;
    return i_sum;
    
  exception when others then raise;
  end;
  
end series#;
/
