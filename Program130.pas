PROGRAM Check(INPUT, OUTPUT);
PROCEDURE Sort(VAR F1: TEXT);
VAR 
  CH: CHAR;
  F2, F3: TEXT;
BEGIN
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, CH);
      WRITE(F2, CH);
      WRITELN('F2 == ', CH);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, CH);
          WRITE(F3, CH);
          WRITELN('F3 == ', CH);
          IF NOT EOLN(F1)
          THEN
            BEGIN
              READ(F1, CH);
              WRITE(F2, CH);
              WRITELN('F2 == ', CH)
            END
        END;
      RESET(F2);
      RESET(F3);
      IF (NOT EOLN(F2)) AND (NOT EOLN(F3))
      THEN
        BEGIN
          READ(F2, CH);
          READ(F3, CH)
        END;
      IF (NOT EOLN(F2)) AND (NOT EOLN(F3))
      THEN
        BEGIN
          Sort(F2);
          Sort(F3) 
        END   
    END
END;

BEGIN
  Sort(INPUT);
END.
