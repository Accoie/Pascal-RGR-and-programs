PROGRAM Reverse(INPUT, OUTPUT);
VAR
  CH: CHAR;
  F1: TEXT;
PROCEDURE RecReverse(VAR F1: TEXT);
VAR
  F2, F3: TEXT;
  Ch, Last: CHAR;
BEGIN
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  IF NOT (EOLN(F1))
  THEN
    BEGIN
      IF NOT (EOLN(F1))
      THEN
        BEGIN
          Last := '2';
          WHILE NOT (EOF(F1))
          DO
            BEGIN
              READ(Ch);
              IF Last = '2'
              THEN
                BEGIN
                  WRITE(F2, Ch);
                  Last := '3'
                END
              ELSE
                BEGIN
                  WRITE(F3, Ch);
                  Last := '2'
                END
            END
          RecReverse(F2);
          RecReverse(F3);
          
        END
    END
END;
BEGIN
 
END.
