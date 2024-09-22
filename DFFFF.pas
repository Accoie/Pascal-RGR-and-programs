PROGRAM ABC(INPUT, OUTPUT);
VAR
  C: STRING;
  F: TEXT;
BEGIN
  ASSIGN(F, 'outpu.txt');
  REWRITE(F);
  READ(C);
  WRITE(F, C);
  CLOSE(F)
END.
