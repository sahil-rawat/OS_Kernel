; Function to print a hex string

print_hex:
    mov cx,0  ; index variable, which will be used to loop

hex_loop:
    cmp cx,4   ; loop 4 times
    je end
;step 1 convert last char of dx to ascii
    mov ax,dx   ;mov dx to ax, we will use ax as our working register

    and ax,0x000f ; this will let us take the last char of ax for example 0x1234 and 0x000f = 0x0004
    add al,0x30

    cmp al,0x39
    jle step2
    add al,7

step2:
    mov bx,HEX_OUT+5
    sub bx,cx
    mov [bx],al

    ror dx,4

    add cx,1
    jmp hex_loop

end:
    mov bx,HEX_OUT
    call print
    ret

HEX_OUT:
    db '0x0000',0