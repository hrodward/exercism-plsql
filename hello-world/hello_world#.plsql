CREATE OR REPLACE PACKAGE hello_world# IS
   FUNCTION hello(
      i_name                                        varchar2 := ''
   ) 
      RETURN varchar2;

END hello_world#;
/

    CREATE OR REPLACE PACKAGE BODY hello_world# IS
    
        FUNCTION hello (
            i_name VARCHAR2 := ''
        ) RETURN VARCHAR2 AS
        BEGIN
            IF i_name is null THEN
                RETURN 'Hello, World!';
            END IF;
            RETURN 'Hello, '
                   || i_name
                   || '!';
        END hello;
    
    END hello_world#;
/
