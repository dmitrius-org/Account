unit uBaseFormF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCommonType;

type
  TBaseFormF = class(TForm)
  private
    FID: Integer;
    FFormAction: TFormAction;

    procedure SetID(const Value: Integer);
    procedure SetFormAction(const Value: TFormAction);
    { Private declarations }
  public
    { Public declarations }
    property  ID: Integer read FID write SetID;
    property  FormAction: TFormAction  read FFormAction write SetFormAction;
  end;

var
  BaseFormF: TBaseFormF;

implementation


{$R *.dfm}

{ TBaseFormF }

procedure TBaseFormF.SetFormAction(const Value: TFormAction);
begin
  FFormAction := Value;
end;

procedure TBaseFormF.SetID(const Value: Integer);
begin
  FID := Value;
end;

end.
