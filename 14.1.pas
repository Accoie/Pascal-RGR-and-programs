PROGRAM ReverseInput(INPUT, OUTPUT);
PROCEDURE Reverse(VAR File1: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(File1)
  THEN
    BEGIN
      READ(File1, Ch);
      Reverse(File1);
      WRITE(Ch)
    END
END;  
BEGIN
  Reverse(INPUT);
  WRITELN;
END.
