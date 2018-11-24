program TimeTracker;

{$mode objfpc}{$H+}

uses
  cthreads, Classes, WebEngineUnit, ParameterManagerUnit, WideStringUnit,
  ProtoHelperUnit, sysutils, AuthenticationUnit, AuthenticationDataUnit,
  SessionDataUnit, RegisterPageHandlerUnit, PageHandlerUnit, SessionManagerUnit;

begin
  WebEngine := TWebEngine.Create(StrToIntDef(GetRunTimeParameterManager.ValueByName['--port'], 8080));

  WebEngine.Start;

  while True do
  begin
    Sleep(60);
    WebEngine.PrintStat;
  end;

  WebEngine.Free;
end.

