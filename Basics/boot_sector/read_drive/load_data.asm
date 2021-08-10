; Function to load data from drive to memory at the address ES:BX

disk_load:
    push dx ; store the value of dx on stack to retrive it back after function call that how many sectors were requested to read

    mov ah,0x02 ;BIOS read sector function

    mov al,dh ;Read DH sectors

    mov ch,0x00 ; Select cylinder 0
    mov dh,0x00 ; Select head 0
    mov cl,0x02 ; Start reading from second sector (i.e. after the boot sector) base starts from 1

    int 0x13 ; BIOS interrupt 

    jc disk_error  ; if carry flag is set then, BIOS gave error in reading

    pop dx ; Restore dx from the stack
    cmp dh,al ; if al (sectors read) != dh (sectors expected) then show error
    jne disk_error

    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print
    ret

DISK_ERROR_MSG:
    db "Disk read error!", 0