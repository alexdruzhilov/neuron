.PHONY: all compile generate

all: get-deps compile generate

get-deps:
	rebar get-deps

compile:
	rebar compile

generate:
	rebar generate
