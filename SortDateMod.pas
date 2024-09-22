UNIT SortDateMod;
INTERFACE
TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun,
                    Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1 .. 31;
  Date   = RECORD
             Mo : Month;
             Day: DayNum
           END;
  FileOfDate = FILE OF Date;
PROCEDURE WriteDate(VAR FOut: TEXT; VAR Res: Date);   {выводит переменную типа date в текстовый файл}
PROCEDURE ReadDate(VAR FIn: TEXT; VAR Res: Date);     {считывает текстовый файл и преобразовывает его в файл типа date}
PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);    {считывает мес€ц из текстового файла}
PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);  {пишет мес€ц в текстовый файл }
FUNCTION Less(VAR D1, D2: Date): BOOLEAN;             {функци€ сравнени€ дат(мес€ц, число)}
PROCEDURE CopyOut(VAR DateFile: FileOfDate);          {вывод файла типа FileOfDate в OUTPUT}
      {копирует файл типа date}
IMPLEMENTATION

PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN{ReadMonth}
  READ(FIn, Ch1, Ch2, Ch3);
  IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := Jan ELSE
  IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := Feb ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := Mar ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := Apr ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := May ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := Jun ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := Jul ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := Aug ELSE
  IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := Sep ELSE
  IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := Oct ELSE
  IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := Nov ELSE
  IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := Dec
    ELSE 
      Mo := NoMonth
END;{ReadMonth}

PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {WriteMonth}
  IF Mo = Jan THEN WRITE(FOut, 'JAN') ELSE
  IF Mo = Feb THEN WRITE(FOut, 'FEB') ELSE
  IF Mo = Mar THEN WRITE(FOut, 'MAR') ELSE
  IF Mo = Apr THEN WRITE(FOut, 'APR') ELSE
  IF Mo = May THEN WRITE(FOut, 'MAY') ELSE
  IF Mo = Jun THEN WRITE(FOut, 'JUN') ELSE
  IF Mo = Jul THEN WRITE(FOut, 'JUL') ELSE
  IF Mo = Aug THEN WRITE(FOut, 'AUG') ELSE
  IF Mo = Sep THEN WRITE(FOut, 'SEP') ELSE
  IF Mo = Oct THEN WRITE(FOut, 'OCT') ELSE
  IF Mo = Nov THEN WRITE(FOut, 'NOV') ELSE
  IF Mo = Dec THEN WRITE(FOut, 'DEC') ELSE  WRITE(FOut, 'NoMonth')
END; {WriteMonth}

PROCEDURE WriteDate(VAR FOut: TEXT; VAR Res: Date);
BEGIN{WriteDate}
  WriteMonth(FOut, Res.Mo);
  WRITE(FOut, Res.Day : 3)
END;{WriteDate}

PROCEDURE ReadDate(VAR FIn: TEXT; VAR Res: Date);
BEGIN{ReadDate}
  ReadMonth(FIn, Res.Mo);
  READ(FIn, Res.Day)
END;{ReadDate}

{Less:= D1 < D2}
FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
BEGIN {Less}
  IF D1.Mo < D2.Mo
  THEN
    Less := TRUE
  ELSE
    IF D1.Mo > D2.Mo
    THEN
      Less := FALSE
    ELSE {D1.Mo = D2.Mo}
      Less := (D1.Day < D2.Day)
END; {Less}

PROCEDURE CopyOut(VAR DateFile: FileOfDate);
VAR
  VarDate: Date;
BEGIN {CopyOut}
  WHILE NOT EOF(DateFile)
  DO
    BEGIN
      READ(DateFile, VarDate);
      WriteDate(OUTPUT, VarDate);
      WRITELN
    END
END;

PROCEDURE CopyDataFiles(VAR F1, F2: FileOfDate);
VAR
  Temp: Date;
BEGIN {CopyDataFiles}
  WHILE NOT EOF(F1)
  DO
    BEGIN
      READ(F1, Temp);
      WRITE(F2, Temp)
    END  
END;{CopyOut}

BEGIN {DateIO}

END.  {DateIO}
