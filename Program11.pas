PROGRAM ADFASDF;
VAR
  Ch: CHAR;
  Num, I: INTEGER;
BEGIN
  Num := 0;
  I := -1;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WHILE I <> Num
      DO
        BEGIN
          WRITE('X');
          I := I + 1;
          WRITELN(I)
        END;
      Num := Num + 1;
      WRITE(Num);
    END
END.
