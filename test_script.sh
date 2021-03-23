#!/bin/bash
cd /jiffy
/ejsonlog/rebar3 compile
ERL_LIBS="/jiffy/_build/default/lib"
cd /ejsonlog
/ejsonlog/rebar3 ct --suite otp_stress_SUITE --case std_handler --name test&
./promtail $1