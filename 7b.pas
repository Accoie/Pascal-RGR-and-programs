PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN
  REWRITE(F1);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1);
  Sorted := 'N';
  WHILE Sorted ='N'
  DO
    BEGIN
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);
          WHILE NOT EOLN(F1)
          DO
            BEGIN
              READ(F1, Ch2);
              IF Ch1 <= Ch2
              THEN
                BEGIN
                  WRITE(F2, Ch1);
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch2);
                  Sorted := 'Y'
                END
            END;
          WRITELN(F2, Ch1)
        END
    END;
    RESET(F2);
    WHILE NOT EOLN(F2)
    DO
      BEGIN
        READ(F2, Ch);
        WRITE(OUTPUT, Ch)
      END
END.
