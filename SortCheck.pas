PROGRAM TreeSort(INPUT, OUTPUT);
CONST
  Letters = '-abcdefghijklmnopqrstuvwxyzאבגדהו¸זחטיךכלםמןנסעףפץצקרשתûü‎‏ÿ';  
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Str: STRING;
               LLink, RLink: Tree;
               Count: INTEGER
             END;
  Status = 0 .. 2;
VAR
  Root: Tree;
  Str: STRING;
FUNCTION More(StrOne, StrTwo: STRING): Status;
VAR
  I, Len: INTEGER;
  Flag: BOOLEAN;
BEGIN
  Flag := FALSE;
  IF Length(StrOne) < Length(StrTwo)
  THEN
    Len := Length(StrOne)
  ELSE
    Len := Length(StrTwo);
  FOR I := 0 TO Len
  DO
    BEGIN
      IF POS(StrOne[I], Letters) > POS(StrTwo[I], Letters)
      THEN
        More := 2   
      ELSE
        IF POS(StrOne[I], Letters) < POS(StrTwo[I], Letters)
        THEN
          More := 1
        ELSE
          IF Length(StrOne) = Length(StrTwo)
          THEN
            More := 0
          ELSE
            More := 2 
    END
END;  
PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {Ñמחהאול כטסע סמ חםאקוםטול Data}
      NEW(Ptr);
      Ptr^.Str := Data;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
      Ptr^.Count := 1;
    END
  ELSE
    IF More(Ptr^.Str, Data) = 2
    THEN
      Insert(Ptr^.LLink, Data)
    ELSE
      IF More(Ptr^.Str, Data) = 1
      THEN
        Insert(Ptr^.RLink, Data)
      ELSE  
        Ptr^.Count := Ptr^.Count + 1
END;  {Insert}

PROCEDURE PrintTree(Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintTree(Ptr^.LLink);
      WRITE(Ptr^.Str);
      WRITE(' ', Ptr^.Count);
      PrintTree(Ptr^.RLink)
    END 
END;  {PrintTree}

BEGIN {TreeSort}
  Root := NIL;
  Str := 'a';
  WHILE NOT EOF(INPUT) AND (Str <> '')
  DO
    BEGIN
      READLN(Str);
      IF Str <> ''
      THEN
        Insert(Root, Str);
    END;
  PrintTree(Root);
  WRITELN
END.
