PROGRAM SyntaxCorrectProgram(INPUT, OUTPUT);
VAR
  C, F: CHAR;
BEGIN
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      IF (C <> ' ') AND (C <> ';')
      THEN
        F := '0';
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
            WHILE (C = ';') AND (NOT EOLN)
            DO
              BEGIN
                WRITE(C);
                READ(C)
              END
          END;           
      IF C = 'E'
      THEN
        BEGIN
          READ(C);
          IF C = 'N'
          THEN
            BEGIN
              F := '1';
              READ(C);
              READ(C);
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
                          IF C <> ' '
                          THEN
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
                              IF (C <> ' ')
                              THEN
                                WRITE(C);
                              IF C = ','
                              THEN
                                WRITE(' ')
                            END
                        END
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
            IF C = ' '
            THEN
              WHILE (C = ' ') AND (NOT EOLN)
              DO
                READ(C);
            IF (C <> '(') AND (C <> 'L') 
            THEN
              BEGIN
                IF C = ';'
                THEN
                  WRITE('  WRITE;')
                ELSE
                  WRITE('  WRITE')
                  F := '0';
                  WRITELN
              END;
//------------------------------------------------------------------------------              
            IF C = '('
            THEN
              BEGIN
                WRITE('  WRITE(');
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
                READ(C);
                IF C = ' '
                THEN
                  WHILE (C = ' ') AND (NOT EOLN)
                  DO
                    READ(C);
                IF C = ';'
                THEN
                  BEGIN
                    WRITE(C);
                    F := '1'
                  END       
              END;
//------------------------------------------------------------------------------              
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
                              IF (C <> ' ')
                              THEN
                                WRITE(C);
                              IF C = ','
                              THEN
                                WRITE(' ');
                          END
                      END;
                    IF C <> ')'
                    THEN
                      BEGIN
                        WRITE('  WRITELN');
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
              
