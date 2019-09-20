-module(prometheus_ranch_example_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	{ok, Listeners}=application:get_env(listeners),
	[{ok, _} = ranch:start_listener(Ref, Transport, TransOpts, Proto, ProtoOpts) ||
		{Ref, Transport, TransOpts, Proto, ProtoOpts} <- Listeners],
	prometheus_ranch_example_sup:start_link().

stop(_State) ->
	ok.
