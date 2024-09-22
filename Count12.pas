PROGRAM Count12(INPUT, OUTPUT);
USES Count1;
VAR 
  Ch, Ch1, Ch2, Ch3: CHAR;
BEGIN
  Start;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Bump
    END;
  Value(Ch1, Ch2, Ch3);
  WRITELN(Ch1, Ch2, Ch3)  
END.
