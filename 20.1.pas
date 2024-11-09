PROGRAM PceudoGraphics(INPUT, OUTPUT);
CONST
  NumOfRows = 25;
  LettersM = [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
  LettersE = [1 .. 6, 11, 12, 13, 14, 15, 16, 21 .. 25];
  LettersI = [1 .. 5, 8, 13, 18, 21 .. 25];
VAR
  Ch: CHAR;
  Flag: BOOLEAN;
PROCEDURE PrintSign(Ch: CHAR);
VAR
  I, J, Num: INTEGER;
  SetNum: SET OF 1 .. 25;
BEGIN
  Num := 1;
  CASE Ch OF
    'M': SetNum := LettersM;
    'E': SetNum := LettersE;
    'I': SetNum := LettersI
  END;
  FOR I := 1 TO NumOfRows
  DO
    BEGIN
      IF I IN SetNum
      THEN
        WRITE('X')
      ELSE
        WRITE(' ');
      IF I MOD 5 = 0
      THEN
        WRITELN
    END
END;  
BEGIN
  Flag := FALSE; 
  WHILE Flag = FALSE
  DO
    BEGIN
      IF NOT EOLN
      THEN
        BEGIN
          READLN(Ch);
          Flag := TRUE;
          IF (Ch = 'I') OR (Ch = 'M') OR (Ch = 'E')
          THEN
            PrintSign(Ch)
          ELSE
            BEGIN 
              Flag := FALSE;
              WRITELN('¬веденный вами символ не поддерживаетс€')
            END          
        END
    END;
  WRITELN 
END.
