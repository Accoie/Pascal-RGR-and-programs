PROGRAM DateIoTest(INPUT, OUTPUT);
USES DateIO;
VAR
  Mo: Month;    
BEGIN
  ReadMonth(INPUT, Mo);
  WriteMonth(OUTPUT, Mo);
  WRITELN
END.
