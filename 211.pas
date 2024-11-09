PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Range = 0 .. Len;
  LetSet = ' ' .. 'Z';
  Str = ARRAY [Range] OF LetSet;
  Chiper = ARRAY [LetSet] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: Range;
  FileIn: TEXT;
  
PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
BEGIN {Initialize}
  Code['1'] := ' ';
  Code['Z'] := 'A';
  Code['Y'] := 'B';
  Code['X'] := 'C';
  Code['#'] := 'D';
  Code['V'] := 'E';
  Code['U'] := 'F';
  Code['T'] := 'G';
  Code['S'] := 'H';
  Code['I'] := 'I';
  Code['Q'] := 'J';
  Code['P'] := 'K';
  Code['!'] := 'L';
  Code['N'] := 'M';
  Code['M'] := 'N';
  Code['2'] := 'O';
  Code['K'] := 'P';
  Code['$'] := 'Q';
  Code['D'] := 'R';
  Code['*'] := 'T';
  Code['C'] := 'X';
  Code['B'] := 'Y';
  Code['A'] := 'Z';
  Code['J'] := 'Q';
  Code['W'] := 'T';
  Code[' '] := '1'
END;  {Initialize}


PROCEDURE Encode(VAR S: Str);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: Range;
BEGIN
  WRITE('Дешифрованная строка: '); {Encode}
  FOR Index := 1 TO Len
  DO
    IF (S[Index] IN ['A' .. 'Z']) OR (S[Index] = '1')
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}


BEGIN {Encryption}
  {Инициализировать Code}
  ASSIGN(FileIn, 'FileIn.txt');
  RESET(FileIn);
  Initialize(Code);
  WHILE NOT EOF(FileIn)
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN(FileIn) AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(FileIn, Msg[I]);
          WRITE(Msg[I])
        END;
      READLN(FileIn);
      WRITELN;
      Encode(Msg)
    END;
  CLOSE(FileIn)
END.  {Encryption}

