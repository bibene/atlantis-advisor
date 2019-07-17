unit RegCode;

interface

 uses Sysutils, Math;

 function CodeString(s: string; smasher: byte): string;
 function CheckCode(Name, Code: string): boolean;

implementation

const
  xUSSR = 'xUSSR �����������';
  DaysOfWeek: array[1..7] of string = ('�����������', '�����������', '�������',
    '�����', '�������', '�������', '�������');

function CodeString(s: string; smasher: byte): string;
begin
  Result := s;
end;

function CheckCode(Name, Code: string): boolean;
begin
  // Real registration removed, and what do you expected from public sources?
  Result := FALSE;
  if (Name = xUSSR) and ((Code = DaysOfWeek[DayOfWeek(Date)])
    or (Code = xUSSR)) then begin
    Result := TRUE;
    Exit;
  end;
end;

end.
