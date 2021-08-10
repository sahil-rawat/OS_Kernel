; Function to print a string 
print:
    mov al,[bx]   ; mov the char at address stored in bx
    cmp al,0      ; check if the address is 0x00, null byte
    je done       ; if null byte then jump to done

    mov ah,0x0e   ; BIOS teletype 
    int 0x10      ; invoke interrupt

    inc bx       ; Increment bx to point to next character
    jmp print    ; loop back to print the next char

done:
    ret          ; Once Done, return back

; Function to print a newline
printnl:
    mov al,0x0a    ; mov newline char 
    mov ah,0x0e    ; BIOS teletype
    int 0x10       ; invoke interrupt
    mov al,0x0d    ; mov carriage return
    mov ah,0x0e    ; BIOS teletype
    int 0x10       ; invoke interrupt
    ret            ; return back