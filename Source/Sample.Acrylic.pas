unit Sample.Acrylic;

interface

uses
  { Delphi }
  System.SysUtils, System.Types, System.UITypes, System.UIConsts,
  System.Classes, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Objects;

type
  TRectangle = class(FMX.Objects.TRectangle)
  protected
    procedure Paint; override;
  end;

  TAcrylicFrame = class(TFrame)
    rctBackground: TRectangle;
  private
    fEnabled: Boolean;
    { Private declarations }
  public
    { Public declarations }
    property EffectEnabled: Boolean read fEnabled write fEnabled;

  end;

implementation

{$R *.fmx}

uses
  { Skia }
  Skia, Skia.FMX.Graphics;

{ TRectangle }

procedure TRectangle.Paint;
var
  LCanvas: ISkCanvas;
  LSaveCount: Integer;
begin
  if (Canvas is TSkCanvasCustom) and (TAcrylicFrame(Parent).EffectEnabled) then
  begin
    LCanvas := TSkCanvasCustom(Canvas).Canvas;
    LSaveCount := LCanvas.Save;
    try
      LCanvas.ClipRect(LocalRect, TSkClipOp.Intersect, True);
      LCanvas.SaveLayer(LocalRect, nil,
        TSkImageFilter.MakeBlur(10, 10, nil, TSkTileMode.Clamp),
        [TSkSaveLayerFlag.InitWithPrevious]);
      inherited;
    finally
      LCanvas.RestoreToCount(LSaveCount);
    end;
  end
  else
    inherited;
end;

end.
