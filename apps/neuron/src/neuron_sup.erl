
-module(neuron_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(N, I, Type), {N, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
	WorkerCount = configuration:get(neuron_count),
    supervisor:start_link({local, ?MODULE}, ?MODULE, [WorkerCount]).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([WorkerCount]) ->
    Children = [?CHILD(N, neuron, worker) || N <- lists:seq(1, WorkerCount)],
    {ok, {{one_for_one, 5, 10}, Children}}.

