PROGRAM SyntaxCorrectProgram(INPUT, OUTPUT);
VAR
  C, F: CHAR;
BEGIN
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(C);
      F = '0';
      
      IF C = 'R'
      THEN
        BEGIN
          IF C = 'E'
          THEN
            BEGIN
              F = '1';
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
                    READ(C);
                    WRITE(C);
                  WRITE(C)
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
                    READ(C);
                    WRITE(C);
                  WRITE(C)
                END
            END 
        END;
        
      IF C = 'W'
      THEN
        IF C = 'R'
        THEN
          BEGIN
            WRITELN;
            READ(C);
            READ(C);
            READ(C);
            READ(C);
            IF C = '('
            THEN
              BEGIN
                WRITE('WRITE(');
                WHILE C <> ')'
                DO
                  READ(C);
                  WRITE(C);
                WRITE(C)  
              END;
            IF C = 'L'
            THEN
              BEGIN
                READ(C) 
                IF C = 'N'
                THEN
                  BEGIN
                    READ(C);
                    IF C = ';'
                    THEN
                      WRITE()
                    IF C = '('
                    THEN
                      BEGIN
                        WRITE('  WRITELN(')
                        WHILE C <> ')'
                        DO
                          READ(C);
                          WRITE(C)
                      END
                     
                  END;
              END;
              
            
      
      IF
      THEN
    IF (F = '0') AND (C <> ' ')
    THEN  
      WRITE(C)             
    END;
END.
