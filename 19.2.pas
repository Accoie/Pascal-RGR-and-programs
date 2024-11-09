PROGRAM SortDate(INPUT, OUTPUT);
USES
  SortDateMod;
  
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;

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
END;  {CopyDataFiles}

BEGIN{SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WHILE NOT EOF(FInput)
  DO
    BEGIN
      ReadDate(FInput, D);
      READLN(FInput);
      {ѕоместить новую дату в DateFile в соответвующуе место}
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {копируем элементы, меньшие чем D из DateFile в TFile}
          RESET(DateFile);
          REWRITE(TFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate, D)
              THEN
                WRITE(TFile, VarDate)
              ELSE
                Copying := FALSE
            END;
          {копируем D в TFile}
          WRITE(TFile, D);
          IF NOT Copying
          THEN
            WRITE(TFile, VarDate);
          {копируем остаток DateFile в TFile}
          CopyDataFiles(DateFile, TFile);
          {копируем TFile в DateFile}
          RESET(TFile);
          REWRITE(DateFile);
          CopyDataFiles(TFile, DateFile)
        END
    END;
  RESET(DateFile);
  CopyOut(DateFile)
END.{SortDate}

