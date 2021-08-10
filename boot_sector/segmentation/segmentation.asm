; This program will help in understanding Segmentation, 

mov ah, 0x0e   ;Making BIOS run in teletype Mode

mov al, [char]   ;1st Try
int 0x10       ;invoking interrupt

mov bx,0x7c0 ;Setting ds to 0x7c0
mov ds,bx    ;Cant Set ds data segment directly so use bx to set ds
mov al, [char] ;2nd Try
int 0x10       ;invoking interrupt


mov al, [es:char]   ;3rd try, using es to offset
int 0x10


mov bx,0x7c0      ;Setting es to 0x7c0 before using it to offset 
mov es,bx         ;Cant Set es directly so use bx to set es
mov al, [es:char] ;4th Try
int 0x10 

char:
    db 'S'

times 510-($-$$) db 0
dw 0xaa55


;after compiling and running the code only the 2nd and 4th try will print an 'S', because the 1st try tries to print the character at the offset by including it in [] but that offset is with respect to 0x00 address in memory instead of from our code in memory, 2nd try first sets the ds data segment to the address 0x7c0 which is the address of our code in memory, thus will corectly print the character, 3rd attempt prints the character with respect to es segment register however es is not set with the offset, 4th attempt first sets the es segment register with 0x7c0 and then uses it as offset to print.