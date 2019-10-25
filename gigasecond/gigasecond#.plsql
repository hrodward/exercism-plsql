CREATE OR REPLACE package gigasecond#
is

  GIGASECOND constant pls_integer  := 1000000000;
  GIGASECOND_IN_DAYS constant number  := GIGASECOND / 60 / 60 / 24;

  function since(inputDate in date) return date;

end gigasecond#;

/


CREATE OR REPLACE package body gigasecond#
is
  function since(inputDate in date) return date is
    resultDate date;
  begin
    -- dbms_output.put_line('inputDate = ' || inputDate);
    resultDate := inputDate + GIGASECOND_IN_DAYS;
    -- return trunc(resultDate, 'YYYY-MM-DD'), 'YYYY-MM-DD');
    return trunc(resultDate); --> Cleaner!!
  end;
end gigasecond#;
/
