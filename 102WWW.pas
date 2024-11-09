PROGRAM SyntaxCorrectProgram(INPUT, OUTPUT);
VAR
  C, F: CHAR;
BEGIN
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      IF C <> ' '
      THEN
        F := '0';
      IF (C <> 'E')
      THEN
        READ(C);
      IF C = 'B'
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
              WRITE('BEGIN');
              READ(C)
            END
        END;
      IF C = ';'
      THEN
        IF F = '1'
        THEN
          BEGIN
            WRITELN;
            WRITE('  ');
            F := '0'
          END;           
      IF C = 'E'
      THEN
        BEGIN
          READ(C);
          IF C = 'N'
          THEN
            BEGIN
              F := '1';
              WRITELN;
              WRITE('END.');
              REWRITE(INPUT)
            END 
        END;        
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
              WHILE (C = ' ') AND (NOT EOLN)
              DO
                READ(C);
              IF (C <> '(') AND (C <> 'L')
              THEN
                BEGIN 
                  WRITELN; 
                  WRITE('  READ');
                  IF C <> ' '
                  THEN
                    WRITE(C)
                END;
              IF C = '('
              THEN
                BEGIN
                  WRITELN;
                  WRITE('  READ(');
                  WHILE (C <> ')') AND (NOT EOLN)
                  DO
                    BEGIN
                      READ(C);
                      IF C <> ' '
                      THEN
                        WRITE(C);
                      IF C = ','
                      THEN
                        WRITE(' ');
                      F := '1'
                    END
                END;
              IF C = 'L'
              THEN
                BEGIN
                  READ(C);
                  READ(C);
                  WHILE (C = ' ') AND (NOT EOLN)
                  DO
                    READ(C);
                  IF C <> '('
                  THEN
                    BEGIN
                      WRITELN;
                      WRITE('  READLN');
                      IF C <> ' '
                      THEN 
                        WRITE(C)
                    END;
                  IF C = '('
                  THEN
                    BEGIN  
                      WRITELN;
                      WRITE('  READLN(');
                      WHILE (C <> ')') AND (NOT EOLN)
                      DO
                        BEGIN
                          READ(C);
                          IF C <> ' '
                          THEN
                            WRITE(C);
                          IF C = ','
                          THEN
                            WRITE(' ')
                        END;
                      F := '1'
                    END
                END
            END 
        END;
      IF C = 'W'
      THEN
        READ(C);
        IF C = 'R'
        THEN
          BEGIN
            WRITELN;
            READ(C);
            READ(C);
            READ(C);
            READ(C);
            WHILE (C = ' ') AND (NOT EOLN) 
            DO
              READ(C);
            IF (C <> '(') AND (C <> 'L')
            THEN
              BEGIN
                WRITE('  WRITE');
                IF C <> 'E'
                THEN
                  F := '0'
                ELSE
                  F := '1'
              END;
            IF C = '('
            THEN
              BEGIN
                WRITE('  WRITE(');
                WHILE (C <> ')') AND (NOT EOLN)
                DO
                  BEGIN
                    READ(C);
                    IF C <> ' '
                    THEN  
                      WRITE(C);
                    IF C = ','
                    THEN
                      WRITE(' ')  
                  END;
                F := '1'
              END;
            IF C = 'L'
            THEN
              BEGIN
                READ(C); 
                IF C = 'N'
                THEN
                  BEGIN
                    READ(C);
                    WHILE (C = ' ') AND (NOT EOLN)
                    DO
                      READ(C);
                    IF C = '('
                    THEN
                      BEGIN
                        WRITE('  WRITELN(');
                        WHILE (C <> ')') AND (NOT EOLN)
                        DO
                          BEGIN
                            READ(C); 
                            IF (C <> ' ')
                            THEN
                              WRITE(C);
                            IF C = ','
                            THEN
                              WRITE(' ')
                          END;
                          F := '1'
                      END;
                    IF C <> ')'
                    THEN
                      BEGIN
                        WRITE('  WRITELN');
                        IF C = 'E'
                        THEN
                          F := '1'
                        ELSE
                          F := '0'
                      END 
                  END
              END
          END;                 
        IF (F = '0') AND (C <> ' ')
        THEN
          BEGIN
            WRITE(C);
            IF C = ','
            THEN
              WRITE(' ')
          END              
    END;
  WRITELN
END.
              
