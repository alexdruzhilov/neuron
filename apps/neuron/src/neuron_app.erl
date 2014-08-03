-module(neuron_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    neuron_sup:start_link(100).

stop(_State) ->
    ok.
