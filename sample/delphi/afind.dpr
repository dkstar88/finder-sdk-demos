program afind;

{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils,
  finderlib in 'finderlib.pas';

procedure FindCallback(Buffer: PPChar; BufferCount: Integer; TotalCount: Integer;
    ErrorCode: Integer); stdcall;
var
  i : Integer;
begin
  OutputDebugString(PChar(Format('Buffer=%x, Count = %d',[Integer(Buffer), BufferCount])));
  Writeln('Buffer Count', BufferCount);
  Writeln('Result TotalCount', TotalCount);
  Writeln('Error Code', ErrorCode);
  Writeln('Result');
  for i :=0 to  BufferCount - 1 do
  begin
    Writeln(StrPas(PChar(Buffer^)));
    Inc(Buffer);
  end;
end;
var
  r : string;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }

    Find(
      ParamStr(1),
      @FindCallback,
      '',
      '',
      20,
      0,
      true,
      false,
      false,
      false,
      True,
      200
      );
    Readln(r);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
