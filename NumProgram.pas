PROGRAM ReadNumber(INPUT, OUTPUT);
VAR
  N, Digit: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  D := -1;
  IF NOT EOLN(F)
  THEN
    READ(Ch)
  ELSE
    BEGIN
      Ch := 'A';
      D := 0
    END;
  IF Ch = '1' 
  THEN
    D := 1
  ELSE
    IF Ch = '2' 
    THEN
      D := 2
    ELSE
      IF Ch = '3' 
      THEN
        D := 3
      ELSE
        IF Ch = '4' 
        THEN
          D := 4
        ELSE
          IF Ch = '5' 
          THEN
            D := 5
          ELSE
            IF Ch = '6' 
            THEN
              D := 6
            ELSE
              IF Ch = '7' 
              THEN
                D := 7
              ELSE
                IF Ch = '8' 
                THEN
                  D := 8
                ELSE
                  IF Ch = '9' 
                  THEN
                    D := 9
                  ELSE
                    IF Ch = '0'
                    THEN 
                      D := 0
END;

BEGIN
  
END.
