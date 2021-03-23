#!/bin/bash
cd /jiffy
/ejsonlog/rebar3 compile
ERL_LIBS="/jiffy/_build/default/lib"
cd /ejsonlog
/ejsonlog/rebar3 ct &
./promtail $1