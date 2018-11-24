unit RegisterPageHandlerUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, PageHandlerUnit, AuthenticationUnit;

type

  { TRegisterPageHandler }

  TRegisterPageHandler = class(TBasePageHandler)
  private
  public
    constructor Create(Authenticator: TAuthenticator);
  end;

implementation

{ TRegisterPageHandler }

constructor TRegisterPageHandler.Create(Authenticator: TAuthenticator);
begin

end;

end.

