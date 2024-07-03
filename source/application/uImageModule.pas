unit uImageModule;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxImageList, cxGraphics;

type
  TIM = class(TDataModule)
    IL: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IM: TIM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
