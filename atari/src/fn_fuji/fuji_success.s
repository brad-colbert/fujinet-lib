        .export     _fuji_success
        .import     return0, return1

        .include    "device.inc"

; bool fuji_success()
;
; returns 1 for success, 0 for error, which is opposite of the value in dstats, which is 0 for OK, 0x80 for error
.proc _fuji_success
        lda     IO_DCB::dstats
        and     #$80
        beq     ok
        jmp     return0
ok:
        jmp     return1
.endproc