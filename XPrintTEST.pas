PROGRAM XPrintTest1(INPUT, OUTPUT);
CONST
  SignOneSet = [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
  SignTwoSet = [1 .. 6, 11, 12, 13, 14, 15, 16, 21 .. 25];
  SignThreeSet = [1 .. 5, 8, 13, 18, 21 .. 25];      
  SignOne = 'M';
  SignTwo = 'E';
  SignThree = 'I';
  
VAR
  SetNut: SET OF 1 .. 25;
  SetNum: SET OF 1 .. 250;
  I, J, Num, Nut, DefFive, DefTen, StopValue: INTEGER;
  Ch: CHAR;
  NoSign: BOOLEAN;
  
FUNCTION Definition(Def: INTEGER; Ch: CHAR; Num: INTEGER): INTEGER;
VAR
  I: INTEGER;
BEGIN
  CASE Ch OF
    SignOne: I := 1;
    SignTwo: I := 2;
    SignThree: I := 3
  END;
  CASE (Num MOD 5) OF
    1: Definition := Def + I; 
    2: Definition := Def + 10 * I;
    3: Definition := Def + 100 * I; 
    4: Definition := Def + 1000 * I;
    0: Definition := Def + 10000 * I
  END
END;

FUNCTION DefChar(Def: INTEGER; Get: INTEGER): CHAR;
VAR
  I: INTEGER;
BEGIN
  CASE (Get MOD 5) OF
    1: I := Def MOD 10;
    2: I := Def DIV 10 MOD 10;
    3: I := Def DIV 100 MOD 10;
    4: I := Def DIV 1000 MOD 10;
    0: I := Def DIV 10000
  END;
  CASE I OF
    1: DefChar := SignOne;
    2: DefChar := SignTwo;
    3: DefChar := SignThree
  END
END;

BEGIN
  DefFive := 0;                          
  DefTen := 0;
  SetNum := [];
  Num := 0;
  I := 0;
  StopValue := 1;
  WHILE (NOT EOLN) AND (StopValue <= 10)
  DO
    BEGIN
      IF (NOT EOLN) AND (StopValue <= 10)
      THEN
        READ(Ch);     
      CASE Ch OF
        SignOne: SetNut := SignOneSet;
        SignTwo: SetNut := SignTwoSet;
        SignThree: SetNut := SignThreeSet
        ELSE 
          NoSign := TRUE
      END;
        IF NoSign = FALSE
        THEN
          BEGIN    
            FOR I := 1 TO 5
            DO
              BEGIN
                IF I IN SetNut
                THEN
                  BEGIN
                    J := I + 5 * Num;
                    SetNum := SetNum + [J]
                  END
              END;
            Num := Num + 1;
            IF Num <= 5
            THEN
              DefFive := Definition(DefFive, Ch, Num)
            ELSE
              DefTen := Definition(DefTen, Ch, Num)
          END
        ELSE
          BEGIN
            WRITELN('¬веденный вами символ ', Ch, ' не поддерживаетс€.');
            WRITELN;
            NoSign := FALSE
          END;
      StopValue := StopValue + 1       
    END;
  FOR I := 1 TO Num
  DO
    BEGIN
      IF I <= 5
      THEN
        Ch := DefChar(DefFive, I)
      ELSE
        Ch := DefChar(DefTen, I);
      CASE Ch OF
        SignOne: SetNut := SignOneSet;
        SignTwo: SetNut := SignTwoSet;
        SignThree: SetNut := SignThreeSet
      END;
      FOR J := 6 TO 25 
      DO
        BEGIN
          IF J IN SetNut
          THEN
            BEGIN         
              IF (J <= 10) AND (J >= 6)
              THEN
                BEGIN
                  Nut := J + (Num - 1) * 5 + 5 * (I - 1);
                  SetNum := SetNum + [Nut]
                END
              ELSE
                IF (J > 10) AND (J <= 15)
                THEN
                  BEGIN
                    Nut := J + 2 * (Num - 1) * 5 + 5 * (I - 1);
                    SetNum := SetNum + [Nut]
                  END
                ELSE
                  IF (J > 15) AND (J <= 20)
                  THEN
                    BEGIN
                      Nut := J + 3 * (Num - 1) * 5 + 5 * (I - 1);
                      SetNum := SetNum + [Nut]
                    END
                  ELSE
                    IF (J > 20) AND (J <= 25)
                    THEN
                      BEGIN
                        Nut := J + 4 * (Num - 1) * 5 + 5 * (I - 1);
                        SetNum := SetNum + [Nut]
                      END      
            END
        END
    END;  
  FOR I := 1 TO (25 * Num)
  DO
    BEGIN
      IF I IN SetNum
      THEN
        WRITE('#')
      ELSE
        WRITE(' ');
      IF I MOD 5 = 0
      THEN
        WRITE(' ');
      IF I MOD (5 * Num) = 0
      THEN
        WRITELN
    END;
  WRITELN
END.
