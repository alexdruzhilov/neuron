.PHONY: all compile generate

all: deps compile generate

deps:
	rebar get-deps

compile:
	rebar compile

generate:
	rebar generate

rel: deps compile generate
