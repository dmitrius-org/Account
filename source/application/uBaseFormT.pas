unit uBaseFormT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.ActnMenus, Vcl.ActnColorMaps, XPStyleActnCtrls,
  System.ImageList, Vcl.ImgList, cxImageList, cxGraphics, Vcl.ComCtrls, uCommonType;

type
  TBaseFormT = class(TForm)
    ActionList: TActionList;
    PopupMenu: TPopupMenu;
    actShow: TAction;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolBar: TToolBar;
    tbAdd: TToolButton;
    tbShow: TToolButton;
    cxImageList32: TcxImageList;
    cxImageList16: TcxImageList;
    tbEdit: TToolButton;
    tbDelete: TToolButton;
    actLookup: TAction;
    N6: TMenuItem;
  private
    FFormAction: TFormAction;
    FID: Integer;
    procedure SetFormAction(const Value: TFormAction);
    procedure SetID(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property  ID: Integer read FID write SetID;
    property  FormAction: TFormAction  read FFormAction write SetFormAction;
  end;

var
  BaseFormT: TBaseFormT;

implementation


{$R *.dfm}

{ TBaseFormT }

procedure TBaseFormT.SetFormAction(const Value: TFormAction);
begin
  FFormAction := Value;
end;

procedure TBaseFormT.SetID(const Value: Integer);
begin
  FID := Value;
end;

end.
