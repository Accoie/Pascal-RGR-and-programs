PROGRAM SyntaxCorrectProgram(INPUT, OUTPUT);
VAR
  C, F: CHAR;                                                                   // C - CHAR, F - FLAG
BEGIN
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      IF (C <> ' ') AND (C <> ';')                                              // CHANGE FLAG ON 0
      THEN
        F := '0';
      READ(C);
      IF C = 'B'                                                                // BLOCK BEGIN
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
      IF C = ';'                                                                // BLOCK ;
      THEN
        IF F = '1'
        THEN
          BEGIN
            WRITELN;
            WRITE('  ');
            F := '0'
          END;           
      IF C = 'E'                                                                // BLOCK END.
      THEN
        BEGIN
          READ(C);
          IF C = 'N'
          THEN
            BEGIN
              WRITELN;
              WRITE('END.');
              REWRITE(INPUT);
              F := '1'
            END 
        END;        
      IF C = 'R'                                                                // BLOCK READ AND READLN
      THEN
        BEGIN
          READ(C);
          IF C = 'E'
          THEN
            BEGIN
              WRITELN;
              READ(C);
              READ(C);
              READ(C);
              IF C = ' '
              THEN
                WHILE (C = ' ') AND (NOT EOLN)
                DO
                  READ(C);
              IF (C <> '(') AND (C <> 'L')                                      // FOR READ WITHOUT ()
              THEN
                BEGIN 
                  IF C = ';'
                  THEN
                    BEGIN
                      WRITE('  READ;');
                      F := '1'
                    END
                  ELSE
                    BEGIN
                      WRITE('  READ');
                      WRITELN;
                      F := '0'
                    END  
                END;
              IF C = '('                                                        // READ WITH ()
              THEN
                BEGIN               
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
                  ELSE
                    BEGIN
                      F := '0';
                      WRITELN
                    END
                END;
              IF C = 'L'                                                        // READLN
              THEN
                BEGIN
                  READ(C);
                  READ(C);
                  IF C = ' '
                  THEN
                    WHILE (C = ' ') AND (NOT EOLN)
                    DO
                      READ(C);
                  IF C = '('                                                    // READLN WITH ()
                  THEN
                    BEGIN     
                      WRITE('  READLN(');
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
                      ELSE
                        BEGIN
                          F := '0';
                          WRITELN
                        END         
                    END
                  ELSE                                                          // READLN WITHOUT ()
                    BEGIN
                      IF C = ';'
                      THEN
                        BEGIN
                          WRITE('  READLN;');
                          F := '1'
                        END
                      ELSE
                        BEGIN
                          WRITE('  READLN');
                          WRITELN;
                          F := '0'
                        END
                    END
                END
            END 
        END;
      IF C = 'W'                                                                // BLOCK WRITE AND WRITELN
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
            IF (C <> '(') AND (C <> 'L')                                        // FOR WRITE WITHOUT ()
            THEN
              BEGIN
                IF C = ';'
                THEN
                  WRITE('  WRITE;')
                ELSE
                  BEGIN
                    WRITE('  WRITE');
                    F := '0';
                    WRITELN
                  END
              END;              
            IF C = '('                                                          // FOR WRITE WITH ()
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
                ELSE
                  BEGIN
                    F := '0';
                    WRITELN
                  END       
              END;              
            IF C = 'L'                                                          // BLOCK WRITELN
            THEN
              BEGIN
                READ(C);   
                IF C = 'N'
                THEN
                  BEGIN
                    READ(C);
                    IF C = ' '
                    THEN
                      WHILE (C = ' ') AND (NOT EOLN)
                      DO
                        READ(C);
                    IF C = '('                                                  // FOR WRITELN WITH ()
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
                        ELSE
                          BEGIN
                            WRITELN;
                            F := '0'
                          END
                      END
                    ELSE                                                        // FOR WRITELN WITHOUT ()
                      BEGIN
                        IF C = ';'
                        THEN
                          BEGIN
                            WRITE('  WRITELN;');
                            F := '1'
                          END
                        ELSE
                          BEGIN
                            WRITE('  WRITELN');
                            F := '0';
                            WRITELN
                          END
                      END
                  END
              END
          END;                 
        IF (F = '0') AND (C <> ' ')                                             // PROCESSING OF OTHER SYMBOLS
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
