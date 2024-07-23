unit uKassaChose;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
  cxGroupBox, cxRadioGroup;

type
  TKassaChose = class(TForm)
    KType: TcxRadioGroup;
    procedure KTypePropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KassaChose: TKassaChose;

implementation

{$R *.dfm}

procedure TKassaChose.KTypePropertiesEditValueChanged(Sender: TObject);
begin
  modalresult := mrOk;
end;

end.
