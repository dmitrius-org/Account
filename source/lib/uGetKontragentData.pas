unit uGetKontragentData;

interface

uses  System.SysUtils, System.Classes, System.Win.ComObj;


  function getKontragentDataByInn(AINN: string): string;

implementation

  function getKontragentDataByInn(AINN: string): string;
  const URL = 'https://egrul.itsoft.ru/short_data/?';
  var HTTP: variant;
  begin
    HTTP := CreateOleObject('MSXML2.XMLHTTP');
    HTTP.Open('get', URL + AINN, False);
    HTTP.Send;
    result:= HTTP.ResponseText;
  end;

end.
