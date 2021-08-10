mov ah, 0x0e  ; Move 0e to Register ah, which makes BIOS to run in teletype mode

mov al, 'H' ; Move Ascii Char 'H' to al, the char in al register will be printed on the screen
int 0x10    ; Invoke Interrupt 0x10, which is screen device interrupt

mov al, 'E'
int 0x10

mov al, 'L'
int 0x10

mov al, 'L'
int 0x10

mov al, 'O'
int 0x10

mov al, ' '
int 0x10

mov al, 'S'
int 0x10

mov al, 'A'
int 0x10

mov al, 'H'
int 0x10

mov al, 'I'
int 0x10

mov al, 'L'
int 0x10

mov al, '!'
int 0x10

times 510-($-$$) db 0  ;Pad the sector by 0x00 till 510th byte

dw 0xaa55               ;write the magic number at the 511, 512th byte, in order to make the code bootable