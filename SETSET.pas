PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
TYPE
  SetDef = SET OF Min .. Max;
VAR
  Dig: INTEGER;
  SetDig: SetDef;
  
  
PROCEDURE NumsDef(VAR Num: INTEGER; VAR SetNum: SetDef);
VAR
  NumP: INTEGER;
BEGIN
  NumP := Num;
  WHILE NumP <= Max
  DO
    BEGIN
      SetNum := SetNum - [NumP];
      NumP := NumP + Num
    END
END;


BEGIN 
  Dig := Min;
  SetDig := [Min .. Max];
  WHILE Dig <= Max
  DO
    BEGIN
      IF Dig IN SetDig
      THEN
        BEGIN
          NumsDef(Dig, SetDig);
          WRITE(Dig, ' ')
        END;
      Dig := Dig + 1
    END;
  WRITELN                    
END.
