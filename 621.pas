PROGRAM Split(INPUT, OUTPUT);
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
BEGIN
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'o';
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Next = 'o'
      THEN
        BEGIN
          WRITE(OUTPUT, Ch, '�������� ������');
          WRITE(Odds, Ch);
          Next := 'e'
        END
        ELSE
          BEGIN
            WRITE(OUTPUT, Ch, '������ ������');
            WRITE(Evens, Ch);
            Next := 'o'
          END;
          READ(INPUT, Ch)
    END;
END.
