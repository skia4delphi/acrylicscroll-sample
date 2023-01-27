program NetflixAcrylic;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Types,
  Skia.FMX,
  Sample.Acrylic in '..\..\Source\Sample.Acrylic.pas' {AcrylicFrame: TFrame},
  Sample.Main in '..\..\Source\Sample.Main.pas' {frmMain};

{$R *.res}

begin
  GlobalUseSkia := True;
  GlobalUseSkiaRasterWhenAvailable := False;
  GlobalUseMetal := True;
  GlobalEventDrivenDisplayUpdates := False;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
