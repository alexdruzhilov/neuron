-module(configuration).

-export([get/1, get/2]).

get(Key) -> 
    configuration:get(Key, undefined).

get(Key, DefaultValue) ->
    case application:get_env(neuron, Key) of
        {ok, Value} -> Value;
        undefined   -> DefaultValue
    end.