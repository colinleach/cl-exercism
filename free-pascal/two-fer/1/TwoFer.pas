unit TwoFer;

{$mode ObjFPC}{$H+}

interface

function TwoFer(const name : string) : string;

implementation

uses SysUtils;

var person : string;

function TwoFer(const name : string) : string;
begin

  if name = '' then person := 'you' else person := name;
  result := 'One for ' + person + ', one for me.';

end;

end.
