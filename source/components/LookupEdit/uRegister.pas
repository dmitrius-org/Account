unit uRegister;

interface

uses System.Classes , Vcl.Controls , DesignIntf, DesignEditors;
   //  Vcl.Dialogs,

procedure Register;

implementation

uses
  uLookupEdit;

procedure Register;
begin
  RegisterComponents('AComponent', [ALookupEdit]);

end;
end.
