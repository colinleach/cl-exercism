unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number : integer) : integer;

implementation

uses SysUtils;

var
  n : longint;

function steps(const number : integer) : integer;
begin

  if number < 1 then raise Exception.Create('Only positive integers are allowed');

  n := number;
  result := 0;
  while n <> 1 do
    begin
      if n mod 2 = 0 then 
        n := n div 2 
      else 
        n := (3 * n) + 1;
      result := result + 1;
    end;
end;

end.
