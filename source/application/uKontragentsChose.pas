unit uKontragentsChose;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
  cxGroupBox, cxRadioGroup;

type
  TKontragentsChose = class(TForm)
    KType: TcxRadioGroup;
    procedure KTypePropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KontragentsChose: TKontragentsChose;

implementation

{$R *.dfm}

procedure TKontragentsChose.KTypePropertiesEditValueChanged(Sender: TObject);
begin
  modalresult := mrOk;
end;

end.
