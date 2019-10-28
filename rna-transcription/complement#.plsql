create or replace package complement#
is

  function of_dna(dna in varchar) return varchar;
  function of_rna(rna in varchar) return varchar;

end complement#;
/


create or replace package body complement#
is


  -- SHOULD HAVE USED TRANSLATE(STRING, FROM, TO) !!!

  function of_dna(dna in varchar) return varchar is
    rna varchar2(250);
  begin
    rna := replace(dna, 'A', 'U');
    rna := replace(rna, 'T', 'A');
    rna := replace(rna, 'G', 'X');
    rna := replace(rna, 'C', 'G');
    rna := replace(rna, 'X', 'C');
    return rna;
  end;


  function of_rna(rna in varchar) return varchar is
    dna varchar2(250);
  begin
    dna := replace(rna, 'A', 'T');
    dna := replace(dna, 'U', 'A');
    dna := replace(dna, 'G', 'X');
    dna := replace(dna, 'C', 'G');
    dna := replace(dna, 'X', 'C');    
    return dna;
  end;
  
end complement#;
/
