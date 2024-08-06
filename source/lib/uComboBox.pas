unit uComboBox;

interface

uses  System.SysUtils, System.UITypes, cxCheckBox, cxCheckComboBox, cxLookAndFeelPainters ;

  procedure ComboBoxFill(AComboBox: TcxCheckComboBox; ASQL: string); overload;
 // procedure ComboBoxFill(AComboBox: TcxComboBoxProperties); overload;


  function GetComboChecks(AComboBox: TcxCheckComboBox): string;



implementation

uses
  uSql;

procedure ComboBoxFill(AComboBox: TcxCheckComboBox; ASQL: string);
var ComboBoxItem :TcxCheckComboBoxItem;
begin
  tSql.Q.Close;
  tSql.Open(ASQL, [], []);
  with tSql.Q do
  begin
    DisableControls;
    AComboBox.Clear;
    AComboBox.Properties.Items.BeginUpdate;
    First;
    while not Eof do
    begin
     ComboBoxItem     := AComboBox.Properties.Items.AddCheckItem(FieldByName('Name').AsString);
     ComboBoxItem.Tag := FieldByName('ID').AsInteger;
     Next;
    end;
    AComboBox.Properties.Items.EndUpdate;
    EnableControls;
  end;
end;


function GetComboChecks(AComboBox: TcxCheckComboBox): string;
Var
  i, s: Integer;
begin
  with AComboBox do
    begin
      AComboBox.Properties.Items.BeginUpdate;
      try
        s:=0;
        for I := 0 to AComboBox.Properties.items.Count - 1 do
          if  States[i] = cbsChecked then
          begin
            Inc(s);
            if s=1 then
              result := IntToStr(AComboBox.Properties.items[i].Tag)
            else
              result := result + ', ' + IntToStr(AComboBox.Properties.items[i].Tag);
          end;

      finally
        AComboBox.Properties.Items.EndUpdate;
      end;//try
    end;//with
//возвращаем список из выбранных ID через запятую: 101,12,1024
end;

end.
