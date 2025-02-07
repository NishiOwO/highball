program highball;

uses
	HighballVersion,
	HighballUtils,
	Sysutils;

function ParseArgs : Integer;
var
	ArgI : Integer;
begin
	ParseArgs := -1;
	for ArgI := 1 to ParamCount do
	begin
	end;
end;

var
	ResultParseArgs : Integer;
begin
	WriteLn('Highball - ActivityPub server in Pascal, version ' + HighballGetVersion());
	WriteLn('Copyright (c) 2025 Nishi & Contributors');
	ResultParseArgs := ParseArgs;
	if not (ResultParseArgs = -1) then
	begin
		Halt(ResultParseArgs);
	end;
	WriteLn('');
	WriteLn('Starting server');
end.
