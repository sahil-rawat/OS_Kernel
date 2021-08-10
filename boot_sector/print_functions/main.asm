; Print HELLO_MSG and GOODBYE_MSG, using the print funciton in print.asm file
[org 0x7c00]

mov bx,HELLO_MSG    ; move the HELLO_MSG to bx register prior to calling print
call print          ; call print function

call printnl        ; call printnl to print \n\r

mov bx, GOODBYE_MSG ; move the GOODBYE_MSG to bx register prior to calling print
call print          ; call printnl to print \n\r

call printnl        ; call printnl to print \n\r

mov dx, [HELLO_MSG]
call print_hex
; include the print.asm file to call the print and printnl function
%include "print.asm"
%include "print_hex.asm"

; Write HELLO_MSG in memory
HELLO_MSG:
    db 'HELLO WORLD!',0

; Write GOODBYE_MSG in memory
GOODBYE_MSG:
    db 'GOODBYE WORLD!',0


times 510-($-$$) db 0
dw 0xaa55