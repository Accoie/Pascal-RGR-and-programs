PROGRAM WithoutSpace(INPUT, OUTPUT);
VAR
  C, F: CHAR;
BEGIN
  F := '0';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(C);
      IF C <> ' '
      THEN
        BEGIN
          WRITE(C);
          F := '1'
        END 
      ELSE
        IF (C = ' ') AND (F = '1')
        THEN
          BEGIN
            WRITE(C);
            F := '0'
          END
    END;
  WRITELN('#')  
END.
