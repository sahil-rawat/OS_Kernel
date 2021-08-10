; This program will help in understanding CPU addressing, BIOS loads the bootsector in memory at an offset of 0x7c00 address.

[org 0x7c00]

mov ah, 0x0e   ;Making BIOS run in teletype Mode

mov al, char   ;1st Try
int 0x10       ;invoking interrupt

mov al, [char] ;2nd Try
int 0x10       ;invoking interrupt

mov bx, char   ;3rd Try, Move char offset in bx register
add bx, 0x7c00 ;add 0x7c00 to bx i.e our offset, 
mov al, [bx]   ;Move the address in the bx register to al
int 0x10

mov al, [0x7c1b] ;4th Try, Precalculate the address of S, by checking at what offset the S apperas in the compiled binary code
int 0x10

char:
    db 'S'

times 510-($-$$) db 0
dw 0xaa55


;after compiling and running the code only the 2nd and 4th try will print an 'S', because the 1st try tries to print the offset itself instead of the character at offset,  2nd try tries to print the character at the offset by including it in [] as we included org instruction in beginning thus making our code aware of where we are in memory thus the offsets will be relative to where we are in memory now, This time in 3rd attempt we try to add 0x7c00 to the offset but this time the offset is already w.r.t our code in memory this will result in adding 0x7c00 again to some address say 0x7c1c which will not work, The 4th attempt still works because it is not using any references to the offset,it precalculates the address of S in memory and prints it