PROGRAM SyntaxCorrectProgram(INPUT, OUTPUT);
VAR
  C, F, C1: CHAR;
BEGIN
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      F := '0';
      READ(C);
      IF C = 'B'
      THEN
        BEGIN
          READ(C1);
          IF (C = 'B') AND (C1 = 'E') 
          THEN
            BEGIN
              F := '1';
              READ(C);
              READ(C);
              READ(C);
              WRITE('BEGIN')
            END
        END;
      IF C = 'E'
      THEN
        BEGIN
          READ(C1);
          IF (C = 'E') AND (C1 = 'N')
          THEN
            BEGIN
              F := '1';
              READ(C);
              READ(C);
              WRITELN;
              WRITE('END.');
              REWRITE(INPUT);
            END 
        END;        

      //Œœ≈–¿“Œ– READ »À» READLN
      IF C = 'R'
      THEN
      //BEGIN OF PROCESS
        BEGIN
          READ(C);
          IF C = 'E'
          THEN
            BEGIN
              F := '1';
              READ(C);
              READ(C);
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
                      IF C <> ')'
                      THEN
                        BEGIN
                          READ(C);
                          WRITE(C);
                          IF C = ','
                          THEN
                            WRITE(' ')
                        END
                    END
                END;
              IF C = 'L'
              THEN
                BEGIN
                  READ(C);
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
                          IF C <> ')'
                          THEN
                            BEGIN
                              READ(C);
                              WRITE(C);
                              IF C = ','
                              THEN
                                WRITE(' ')
                            END;
                        END;
                    END;
                  
                  END
            END 
        END;
      //END OF PROCESS
        
      //Œœ≈–¿“Œ– WRITE »À» WRITELN  
      IF C = 'W'
      THEN
      //BEGIN OF PROCESS
        READ(C);
        IF C = 'R'
        THEN
          BEGIN
            WRITELN;
            READ(C);
            READ(C);
            READ(C);
            READ(C);
            IF (C <> '(') AND (C <> 'L')
            THEN
              WRITE('  WRITE');
              F := '0';
            IF C = '('
            THEN
              BEGIN
                WRITE('  WRITE(');
                WHILE (C <> ')') AND (NOT EOLN)
                DO
                  BEGIN
                    READ(C);
                    IF C <> ')'
                    THEN  
                      WRITE(C);
                      IF C = ','
                      THEN
                        WRITE(' ')  
                  END 
              END;
            IF C = 'L'
            THEN
              BEGIN
                READ(C); 
                IF C = 'N'
                THEN
                  BEGIN
                    READ(C);
                    IF C = '('
                    THEN
                      BEGIN
                        WRITE('  WRITELN(');
                        WHILE (C <> ')') AND (NOT EOLN)
                        DO
                          BEGIN
                            READ(C); 
                            IF C <> ')'
                            THEN
                              WRITE(C);
                              IF C = ','
                              THEN
                                WRITE(' ');
                          END
                      END;
                    IF C <> ')'
                    THEN
                      WRITE('  WRITELN');
                      F := '0' 
                  END
              END
          END;
          
        //END OF PROCESS                  
        IF (F = '0') AND (C <> ' ')
        THEN  
          WRITE(C)             
    END
END.
              
