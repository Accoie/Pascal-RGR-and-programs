PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  Ch: CHAR;
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  
BEGIN
  ClassTotal := 0;
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      Ch := 'A';
      WHILE Ch <> ':'
      DO
        BEGIN
          READ(Ch);
          IF (Ch <> ' ') AND (Ch <> ':')
          THEN
            WRITE(Ch)
        END;
      WHILE WhichScore <= NumberOfScores
      DO
        BEGIN
          READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(': ', Ave DIV 10 + 1)
      ELSE
        WRITELN(': ', Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  WRITELN;
  WRITELN('Class average: ');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10, ClassTotal MOD 10 DIV 10: 1)
END.  {AverageScore}

