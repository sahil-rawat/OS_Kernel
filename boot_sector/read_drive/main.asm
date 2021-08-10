[org 0x7c00]

mov [BOOT_DRIVE],dl

mov bp, 0x8000
mov sp,bp

mov bx,0x9000
mov dh, 5
mov dl, [BOOT_DRIVE]
call disk_load

mov dx,[0x9000]
call print_hex

%include "load_data.asm"
%include "print.asm"
%include "print_hex.asm"

BOOT_DRIVE:
    db 0

times 510-($-$$) db 0 
dw 0xaa55

times 256 dw 0xdada 
times 256 dw 0xface