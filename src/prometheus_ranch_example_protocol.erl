-module(prometheus_ranch_example_protocol).
-behaviour(ranch_protocol).

-export([start_link/3]).
-export([init/3]).

start_link(Ref, Transport, Opts) ->
	Pid = spawn_link(?MODULE, init, [Ref, Transport, Opts]),
	{ok, Pid}.

init(Ref, Transport, Opts) ->
	{ok, Socket} = ranch:handshake(Ref),
	Timeout = maps:get(timeout, Opts, infinity),
	loop(Socket, Transport, Timeout).

loop(Socket, Transport, Timeout) ->
	case Transport:recv(Socket, 0, Timeout) of
		{ok, Data} when Data =/= <<4>> ->
			Transport:send(Socket, Data),
			loop(Socket, Transport, Timeout);
		_ ->
			ok = Transport:close(Socket)
	end.
