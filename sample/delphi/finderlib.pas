unit finderlib;

interface

const
  ERR_OK = 0;
  ERR_TIMEOUT = 1;
  ERR_FINDER_NOT_RUN = 2;
  ERR_COMM = 3;
  ERR_FINDER_VER = 4;
  ERR_FINDER_NOT_INSTALLED = 9;
  ERR_UNKNOWN = 99;


const
  finderlibdll = 'finderlib.dll';

type
  TResultCallBack = procedure(const Buffer: PPChar; BufferCount: Integer; TotalCount: Integer;
    ErrorCode: Integer); stdcall;


function Find(const AStr: String;
        ACallback: TResultCallBack;
        ADir, AFilter: String;
        const ACount: Integer = 100;
        const Afrom: Integer = 0;
        const ASpaceOr: Boolean = False;
        const AWholeWords: Boolean = False;
        const ACaseSensitive: Boolean = False;
        const AIncludeDir: Boolean = True;
        const AIncludeFiles: Boolean = True;
        const ATimeoutMS: Word = 1000): Integer;

function LaunchFinder: Boolean; stdcall; external finderlibdll
function IsFinderRunning: Boolean; stdcall; external finderlibdll

function CheckRequirement: Integer; stdcall; external finderlibdll

function _Find(const AStr: PChar;
  const ACallback: TResultCallBack;
    const ADir, AFilter: PChar;
    const ACount: Integer = 100;
    const Afrom: Integer = 0;
    const ASpaceOr: Boolean = False;
    const AWholeWords: Boolean = False;
    const ACaseSensitive: Boolean = False;
    const AIncludeDir: Boolean = True;
    const AIncludeFiles: Boolean = True;
    const ATimeoutMS: Word = 1000)
    : Integer; stdcall; external finderlibdll;

implementation

uses Windows;

function Find(const AStr: String;
        ACallback: TResultCallBack;
        ADir, AFilter: String;
        const ACount: Integer = 100;
        const Afrom: Integer = 0;
        const ASpaceOr: Boolean = False;
        const AWholeWords: Boolean = False;
        const ACaseSensitive: Boolean = False;
        const AIncludeDir: Boolean = True;
        const AIncludeFiles: Boolean = True;
        const ATimeoutMS: Word = 1000): Integer;
var
  lib: Dword;
  findfunc: Pointer;
begin
      Result := _Find( PChar(AStr), ACallback, PChar(ADir), PChar(AFilter),
        ACount, AFrom, ASpaceOr, AWholeWords, ACaseSensitive, AIncludeDir,
        AIncludeFiles, ATimeoutMS);
//  lib := LoadLibrary(finderlibdll);
//  if lib <> 0 then
//  begin
//    //findfunc := GetProcAddress(lib, 'find');
//    //TProcedure(findfunc)();
//    findfunc := GetProcAddress(lib, 'find');
//    if Assigned(findfunc) then
//    begin
//      Result := PFindFunc(findfunc)^( PChar(AStr), @ACallback, PChar(ADir), PChar(AFilter),
//        ACount, AFrom, ASpaceOr, AWholeWords, ACaseSensitive, AIncludeDir,
//        AIncludeFiles, ATimeoutMS);
//    end;
//  end;
end;

end.
