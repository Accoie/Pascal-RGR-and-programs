program Program23;
VAR
  I: INTEGER;
  Ch: CHAR;
  F: TEXT;
begin
  ASSIGN(F, 'outpu.txt');
  REWRITE(F);
  FOR I := 0 TO 6
  DO
    BEGIN
      READ(Ch);
      Ch := CHR(ORD(Ch) + 1);
      WRITE(F, Ch)
    END;
  CLOSE(F)
end.
