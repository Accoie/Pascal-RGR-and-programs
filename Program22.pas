program Program22;
USES
  IOmod;
VAR
  Ch: CHAR;
  I: INTEGER;
  Str: STRING;
  F: TEXT;
begin
  ASSIGN(F, 'outpu.txt');
  REWRITE(F);
  WHILE NOT EOLN
  DO
    BEGIN
      Str := '';
      ChIntoStr(INPUT, Str);
      WRITE(F, ' ', Str)
    END;
  CLOSE(F)
end.
