; understanding how stack works

mov bp, 0x8000 ; initialising Base Pointer at addr 0x8000
mov sp, bp     ; loading stack Pointer 


mov ah, 0x0e   ; BIOS teletype mode

push 'L'       ; Push character 'L' to stack
push 'I'       ; Push character 'I' to stack
push 'H'       ; Push character 'H' to stack
push 'A'       ; Push character 'A' to stack
push 'S'       ; Push character 'S' to stack

;The strings are pushed in reverse order as stack works in LIFO manner

pop bx              ; Popping top of stack and storing in bx
mov al, bl          ; As pop instruction pops 16 bit, but we are interested in only most significant 8 bits which are stored in bl
int 0x10            ; invoking screen interrupt

; Repeating same for popping other character
; -----------------------------------------
pop bx              
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10
; -----------------------------------------

mov al,[0x7ffe]      ; We can specify the memory address of the character as well, we know that the stack's base is at 0x8000 and each character is item as 16 bit so the first character will start at 0x8000-0x2=0x7ffe location
int 0x10

times 510-($-$$) db 0
dw 0xaa55