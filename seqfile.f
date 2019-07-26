define seqfileing

0 value fid
variable temp

: open  ( adr c - )
    2dup file-exists not if r/w create-file else r/w open-file then throw to fid ;

: close  ( - )
    fid close-file drop ;

: get  ( adr #bytes fid - )
    fid read-file nip throw ;

: gets  ( adr struct - )
    struct.size @ get ;

: getobj  ( obj - )
    objdata get ;

: getn ( - n )
    temp cell get temp @ ;
    
: getc ( - n )
    temp #1 get temp c@ ;

: get$  ( adr - )
    getn over over swap !  ( n adr - )
    cell u+  ( adr+cell c ) get ;

: put  ( adr #bytes - )
    fid write-file throw ;

: puts  ( adr struct - )
    struct.size @ put ;

: putobj  ( obj - )
    objdata put ;

: putn ( n - )
    temp ! temp cell put ;
    
: putc ( n fid - )
    0 temp !  temp c!  temp #1 put ;

: put$ ( adr c - )
    dup putn put ;


using forth