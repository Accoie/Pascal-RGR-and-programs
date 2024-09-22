PROGRAM SyntaxCorrectProgramR(INPUT, OUTPUT);
VAR
  C, F: CHAR;
BEGIN
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(C);
      F := '0';
      IF C = 'R'
      THEN
        BEGIN
          READ(C);
          IF C = 'E'
          THEN
            BEGIN
              F := '1';
              READ(C);
              READ(C);
              READ(C);
              IF C = '('
              THEN
                BEGIN
                  WRITELN;
                  WRITE('  READ(');
                  WHILE C <> ')'
                  DO
                    BEGIN
                      IF C <> ')'
                      THEN
                        READ(C);
                        WRITE(C)
                    END
                END;
              IF C = 'L'
              THEN
                BEGIN
                  READ(C);
                  READ(C);
                  WRITELN;
                  WRITE('  READLN(');
                  WHILE C <> ')'
                  DO
                    BEGIN
                      IF C <> ')'
                      THEN
                        READ(C);
                        WRITE(C)
                    END
                END
            END 
        END;           
    IF (F = '0') AND (C <> ' ')
    THEN  
      WRITE(C)             
    END
END.
