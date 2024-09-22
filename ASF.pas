PROGRAM FASDF;
VAR
  I: INTEGER;
  C: CHAR;
  F: TEXT;
BEGIN
  ASSIGN(F, 'testik.txt');
  RESET(F);
  WHILE NOT EOF(F)
  DO
    BEGIN
      IF NOT EOLN(F)
      THEN
        READ(F, C);
      WRITE(C)
    END;
  CLOSE(F);
  WRITELN
END.
