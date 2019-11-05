create or replace package prime#
is

  type primes_type is table of pls_integer;
  
  invalid_argument_error exception;
  
  function nth(input in pls_integer) return pls_integer;

end prime#;
/

create or replace package body prime#
is
  
  function check_prime(primes in primes_type, cur_val in pls_integer) return boolean is
  begin
    for idx in 2 .. primes.count loop
      if cur_val mod primes(idx) = 0 then
        return false;
      end if;
    end loop;
    return true;
  end;

  
  function nth(input in pls_integer) return pls_integer is    
    primes primes_type := primes_type(); -- Initialise it
    cur_idx pls_integer := 3;
    cur_val pls_integer := 5;
     is_prime boolean := true;
  begin
  
    case
      when input <= 0 then raise invalid_argument_error;
      when input = 1 then return 2;
      when input = 2 then return 3;
      else null;
    end case;    
    
    primes.extend(2); -- Extend it
    primes(1) := 2;
    primes(2) := 3;
    
    while cur_idx <= input loop
      is_prime := check_prime(primes, cur_val);
      if is_prime then
        primes.extend();
        primes(cur_idx) := cur_val;
        cur_idx := cur_idx + 1;
      end if;
      if not is_prime or cur_idx < input then
        cur_val := cur_val + 2;
      end if;
    end loop;
    
    return cur_val;
  end;
  
end prime#;
/
