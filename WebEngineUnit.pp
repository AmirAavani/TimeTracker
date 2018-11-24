unit WebEngineUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, HttpServerThreadUnit, AuthenticationUnit;

type

  { TWebEngine }

  TWebEngine = class(THTTPServerThread)
  public
    constructor Create(Port: Word);

    procedure PrintStat;
  protected
    procedure DefaultRequestHandler(Sender: TObject;
          ARequest: THTTPServerRequest;
          AResponse : THTTPServerResponse); override;

  private
    Authenticator: TAuthenticator;

  end;

var
  WebEngine: TWebEngine;

implementation
uses
  ParameterManagerUnit, StrUtils;

{ TWebEngine }

constructor TWebEngine.Create(Port: Word);
var
  DataPath: AnsiString;
  DataStream: TStream;

begin
  inherited Create(Port, 'text/html', 'utf-8');

  DataPath := IfThen(GetRunTimeParameterManager.ValueByName['--data_path'] <> 'None',
     GetRunTimeParameterManager.ValueByName['--data_path'],
     './');
  if FileExists(ConcatPaths([DataPath, 'user_auth.bin'])) then
    DataStream := TFileStream.Create(ConcatPaths([DataPath, 'user_auth.bin']), fmOpenRead)
  else
    DataStream := TStringStream.Create('');

  Authenticator := TAuthenticator.Create(DataStream);
  DataStream.Free;

end;

procedure TWebEngine.PrintStat;
begin

end;

procedure TWebEngine.DefaultRequestHandler(Sender: TObject;
  ARequest: THTTPServerRequest; AResponse: THTTPServerResponse);
var
  IsLoggedInUser: Boolean;

begin
  if StrUtils.StartsStr('/register', ARequest.PathInfo) then
    WriteLn(ARequest.PathInfo)
  else
    WriteLn(ARequest.PathInfo);
  // IsLoggedInUser := Authenticator.CheckForLogin(ARequest);
//  if ARequest.PathInfo = 'Login';
end;

end.

