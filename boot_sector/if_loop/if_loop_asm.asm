mov ah,0x0e

mov bx,3

cmp bx,4
jle if1
cmp bx,40
jl elif1
mov al,'C'
jmp end


if1:
    mov al,'A'
    jmp end
elif1:
    mov al,'B'
    jmp end

end:
    int 0x10

times 510-($-$$) db 0
dw 0xaa55
    
    
