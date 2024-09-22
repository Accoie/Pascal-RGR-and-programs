PROGRAM CountWords(INPUT, OUTPUT);
USES
  InputSortMod, Storage;

VAR
  FIn, FOut: TEXT;
  Ch: CHAR;
  Str: STRING;
  
BEGIN
  ASSIGN(FIn, 'words.txt');
  ASSIGN(FOut, 'stat.txt');
  RESET(FIn);
  REWRITE(FOut); 
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      Str := '';
      ChIntoStr(FIn, Str);
      IF (NOT EOF(FIn)) AND (EOLN(FIn))
      THEN
        READLN(FIn);
      IF Str <> ''
      THEN
        InserToStorage(Str)
    END;
  PrintTreeStorage(FOut);
  CLOSE(FIn);
  CLOSE(FOut);
  WRITELN
END.
