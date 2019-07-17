define seqfileing

0 value fid
variable temp

: open  2dup file-exists not if r/w create-file else r/w open-file then throw ;
: close  close-file drop ;

: get  ( adr #bytes fid - )
    read-file nip throw ;

: gets  ( adr struct fid - )
    >r struct.size @ r> get ;

: geto  ( obj fid - )
    >r objdata r> get ;

: getn ( fid - n )
    >r temp cell r> get
    temp @ ;
    
: getc ( fid - n )
    >r temp #1 r> get
    temp c@ ;

: get$  ( adr fid - )
    dup >r  getn over over swap !  ( n adr - )
    cell u+  ( adr+cell c )  r> get ;

: put  ( adr #bytes fid - )
    write-file throw ;

: puts  ( adr struct fid - )
    >r struct.size @ r> put ;

: puto  ( obj fid - )
    >r objdata r> put ;

: putn ( n fid - )
    >r temp !
    temp cell r> put ;
    
: putc ( n fid - )
    >r 0 temp !  temp c! 
    temp #1 r> put ;

: put$ ( adr c fid - )
    2dup putn put ;


using forth