
struct: %mystruct
    %mystruct svar s.a 
    %mystruct svar s.b
    %mystruct svar s.c  
    %mystruct svar s.d 

create s %mystruct struct,
    1 s s.a !
    2 s s.b !
    3 s s.c !
    4 s s.d ! 

0 0 class: _myclass
    var a
    var b
    var c
    var d
;class

_myclass static value instance
    instance as
    1 a !
    2 b !
    3 c !
    4 d !

s" prg/seqfile/test.dat" open to fid
    buf 10 cells fid put
    s %mystruct fid puts
    instance fid puto
    999 fid putn
    $fe fid putc
    s" Check check one two" fid put$
fid close

s" prg/seqfile/test.dat" open to fid
    buf 10 cells erase
    buf @ 0 test
    buf 10 cells fid get
    buf @ 1 test
    buf 9 cells + @ 10 test

    s %mystruct struct.size @ erase
    s s.a @ 0 test
    s %mystruct fid gets
    s s.a @ 1 test
    s s.d @ 4 test

    _myclass instance /object
    instance 's a @ 0 test
    instance fid geto
    instance 's a @ 1 test
    instance 's d @ 4 test

    fid getn 999 test
    fid getc $fe test

    buf fid get$  buf count s" Check check one two" compare [if] cr .( String test failed ) [then]
fid close


cr .( Tests successful. )