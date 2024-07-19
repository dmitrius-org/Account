unit uGrantUtils;

interface

uses Windows, Messages, SysUtils, Classes, Variants, Dialogs, Vcl.ActnList;

Type
  /// <summary>
  /// TGrant - клас для работы с правами пользователя
  /// </summary>
  TAccess = class
  strict private
  class var FUserGrant: TStringList;

  private
  public

    /// <summary>
    /// GrantTemplateCreate - Создание шаблона меню.
    /// Сохраняет наименования пунктов actions в таблицу tMenu.
    /// </summary>
     class procedure GrantTemplateCreate(AComp: TComponent);  static;

    /// <summary>
    /// UserGrantLoad - загрузка прав пользователя в память
    /// </summary>
     class procedure UserGrantLoad();  static;

    /// <summary>
    /// SetGrant - применени прав пользователя к меню системы
    /// </summary>
     class procedure SetGrant(AComp: TComponent; AAction:TActionList);  static;
  end;


implementation

uses uVarUtils, uSql, MTLogger;

{ TGrant }

class procedure TAccess.GrantTemplateCreate(AComp: TComponent);
var loop, Index: Integer;
    Child : TComponent;
    Menu:TActionList;
begin
  for loop := 0 to AComp.ComponentCount -1 do
  Begin
    Child := AComp.Components[loop];
    if Child is TActionList then
    Begin
      Menu:= TActionList(Child);

      tSql.q.Close;
      tSql.q.SQL.Text :=
         '''
          insert tMenu (MenuID, N, Caption, Name, Type, ParentID )
          select t.MenuID
                ,t.MenuID
                ,:Caption
                ,:Name
                ,1
                ,m.MenuID
            from tMenu m (nolock)
           inner join ( Select max(MenuID)+1 MenuID
                          from tMenu m (nolock)
                       ) t
                   on 1=1
           where m.MenuID = :ParentID
             and not exists (select 1
                               from tMenu mm (nolock)
                              where mm.Name = :Name)
          select 0
         ''';

      for Index := 0 to Menu.ActionCount- 1 do
      Begin
        // если -1, то пункт не контролируем правами
        if Menu[Index].Tag = -1 then
          Continue;

         tSql.q.Close;
         tSql.q.ParamByName('Caption').Value := Menu[Index].Caption;
         tSql.q.ParamByName('Name').Value := AComp.ClassName + '.' + Menu[Index].Name;
         tSql.q.ParamByName('ParentID').Value := Menu.Tag;

         tSql.q.Open;
      end;
    end;
  end;
end;

class procedure TAccess.SetGrant(AComp: TComponent; AAction: TActionList);
var Index:Integer;
    r : integer;
begin
  for Index := 0 to AAction.ActionCount- 1 do
  Begin
    try
      // если -1, то пункт не контролируем правами
      if AAction[Index].Tag = -1 then Continue;

      r:= VarToInt(FUserGrant.Values[Trim(AComp.ClassName + '.' + AAction[Index].Name)]);

      AAction[Index].Tag:=r;

      //logger.Info(AComp.ClassName + '.' + vartostr(AAction[Index].Name) + ' = ' + r.ToString);
    except
      on E: Exception do
      begin
        logger.Info(Format('Ошибка  [%s]', [E.Message]));
      end;
    end;
  end;
end;

class procedure TAccess.UserGrantLoad;
var i: Integer;
begin
  //FUserGrant.Clear;
  FUserGrant := TStringList.Create();      //FormNames.Values[c] :=

  tSql.q.Close;
  tSql.q.SQL.Text :=
  '''
    declare @UserID numeric(18, 0)
     select @UserID = dbo.GetUserID()

     exec GrantSelect
           @ObjectID   = @UserID
          ,@ObjectType = 0

     Select Name
       from vGrant
      where ObjectID = @UserID
        and (value = 1
         or GroupValue = 1)
        and Name <> ''
      order by N
  ''';

  tSql.q.Open;

  tSql.q.First;
  for i := 0 to tSql.q.RecordCount-1 do
  Begin
    FUserGrant.Values[tSql.q.FieldByName('Name').AsString] := '1';
    tSql.q.Next;
  end;
end;

end.
