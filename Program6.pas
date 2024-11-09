PROGRAM MaxChar(INPUT, OUTPUT);
VAR
  Max, Ch: CHAR;
BEGIN
  WHILE NOT EOF
  DO
    BEGIN
      READ(Max);
      WHILE NOT EOLN
      DO
        BEGIN
          READ(Ch);
          IF Max < Ch
          THEN
            Max := Ch;
          IF EOLN
          THEN
            READLN(Max)
        END;
      WRITE(Max)
    END;
  WRITELN;
END.
