unit HBWellKnown;

interface
uses
	HBRoute;

type
	TRouteWellKnown = class(TRouteBase)
	protected
		procedure Job(); override;
	end;

var
	RouteWellKnown: TRouteWellKnown;

implementation
uses
	FPJSON,
	HighballConfig;

procedure TRouteWellKnown.Job();
var
	EPName: String;
begin
	EPName := RouteReq.RouteParams['name'];
	if EPName = 'nodeinfo' then
	begin
		RouteJSON.Arrays['links'] := TJSONArray.Create();
		RouteJSON.Arrays['links'].Add(TJSONObject.Create());
		RouteJSON.Arrays['links'].Objects[0].Strings['rel'] := 'http://nodeinfo.diaspora.software/ns/schema/2.1';
		RouteJSON.Arrays['links'].Objects[0].Strings['href'] := HighballParsedConfig.ServerURL + '/nodeinfo/2.1';
		RouteJSON.Arrays['links'].Add(TJSONObject.Create());
		RouteJSON.Arrays['links'].Objects[1].Strings['rel'] := 'http://nodeinfo.diaspora.software/ns/schema/2.0';
		RouteJSON.Arrays['links'].Objects[1].Strings['href'] := HighballParsedConfig.ServerURL + '/nodeinfo/2.0';
	end;
end;

end.
