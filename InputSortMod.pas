UNIT InputSortMod;
INTERFACE

PROCEDURE ChIntoStr(VAR FIn: TEXT; VAR Str: STRING);

IMPLEMENTATION
CONST
  LetSet = ['a' .. 'z', 'à' .. 'å', '¸', 'æ' .. 'ï', 'ð' .. 'ÿ'];
  UpLetSet = ['A' .. 'Z', 'À' .. 'ß'];
PROCEDURE ChIntoStr(VAR FIn: TEXT; VAR Str: STRING);
VAR                    
  Stop, ChFlag, Hyphen: BOOLEAN;
  Ch: CHAR;
BEGIN
  ChFlag := FALSE;
  Hyphen := FALSE;
  Stop := FALSE;
  WHILE (Stop = FALSE) AND (NOT EOLN(FIn))
  DO
    BEGIN
      IF NOT EOLN(FIn)
      THEN
        READ(FIn, Ch);
      IF Ch = '-'
      THEN
        BEGIN
          IF Hyphen = TRUE
          THEN 
            Stop := TRUE; 
          IF ChFlag = TRUE
          THEN
            Hyphen := TRUE
        END; 
      IF Ch IN LetSet
      THEN
        BEGIN
          IF Hyphen = FALSE
          THEN
            Str := Str + Ch
          ELSE
            Str := Str + '-' + Ch;
          Hyphen := FALSE;
          ChFlag := TRUE
        END
      ELSE
        IF Ch IN UpLetSet
        THEN
          BEGIN
            IF Hyphen = FALSE
            THEN
              Str := Str + CHR(ORD(Ch) + 32)
            ELSE
              Str := Str + '-' + CHR(ORD(Ch) + 32);
            Hyphen := FALSE;
            ChFlag := TRUE
          END
        ELSE
          IF Ch = '¨'
          THEN
            BEGIN
              IF Hyphen = FALSE
              THEN
                Str := Str + CHR(ORD(Ch) + 16)
              ELSE
                Str := Str + '-' + CHR(ORD(Ch) + 16);
              Hyphen := FALSE;
              ChFlag := TRUE              
            END
          ELSE
            IF Ch <> '-'
            THEN
              Stop := TRUE
            ELSE
              IF Hyphen = TRUE
              THEN
                ChFlag := FALSE      
    END
END; 
BEGIN
END.
