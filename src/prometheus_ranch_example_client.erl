-module(prometheus_ranch_example_client).

-export([connect/2, close/1, send/2, recv/1, recv/2, talk/2, talk/3, talk_random/2, talk_random/3]).

connect(Ref, Opts) ->
	Opts1 = lists:keydelete(active, 1, Opts),
	Opts2 = [{active, false}|Opts1],
	{Addr, Port} = ranch:get_addr(Ref),
	{ok, _} = gen_tcp:connect(Addr, Port, Opts2).

close(Sock) ->
	ok = gen_tcp:close(Sock).

send(Sock, Data) ->
	ok = gen_tcp:send(Sock, Data).

recv(Sock) ->
	recv(Sock, 5000).
recv(Sock, Timeout) ->
	{ok, _} = gen_tcp:recv(Sock, 0, Timeout).

talk(Sock, Data) ->
	talk(Sock, Data, 5000).
talk(Sock, Data, Timeout) ->
	send(Sock, Data),
	recv(Sock, Timeout).

talk_random(Sock, NBytes) ->
	talk_random(Sock, NBytes, 5000).
talk_random(Sock, NBytes, Timeout) ->
	Data = << <<(rand:uniform(256)-1)>> || _ <- lists:seq(1, NBytes) >>,
	talk(Sock, Data, Timeout).
