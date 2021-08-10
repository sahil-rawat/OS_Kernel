; This program will help in understanding CPU addressing, BIOS loads the bootsector in memory at an offset of 0x7c00 address.

mov ah, 0x0e   ;Making BIOS run in teletype Mode

mov al, char   ;1st Try
int 0x10       ;invoking interrupt

mov al, [char] ;2nd Try
int 0x10       ;invoking interrupt

mov bx, char   ;3rd Try, Move char offset in bx register
add bx, 0x7c00 ;add 0x7c00 to bx i.e our offset, here we are adding 0x7c00 because we know that the BIOS loaded us in the memory at an offset of 0x7c00 from start
mov al, [bx]   ;Move the address in the bx register to al
int 0x10

mov al, [0x7c1b] ;4th Try, Precalculated the address of S, by checking at what offset the S apperas in the compiled binary code
int 0x10

char:
    db 'S'

times 510-($-$$) db 0
dw 0xaa55


;after compiling and running the code only the 3rd and 4th try will print an 'S', because the 1st try tries to print the offset itself instead of the character at offset,  2nd try tries to print the character at the offset by including it in [] but that offset is with respect to 0x00 address in memory instead of from our code in memory, 3rd attempt prints the character by taking the offset and adding it to 0x7c00 which we know that our code is loaded at address 0x7c00 in memory, similarly 4th attempt precalculates the address of S in memory and prints it