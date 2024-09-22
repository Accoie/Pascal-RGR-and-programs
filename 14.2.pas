PROGRAM RCopyProgram(INPUT, OUTPUT);
PROCEDURE RCopy(VAR File1: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(File1)
  THEN
    BEGIN
      READ(File1, Ch);
      WRITE(Ch);
      RCopy(File1)
    END
END;
BEGIN
  RCopy(INPUT);
  WRITELN
END.
