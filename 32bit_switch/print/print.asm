[bits 32]

VIDEO_MEM equ 0xb8000
WHITE_ON_BLCK equ 0x0f


print_string:
    pusha
    mov edx, [VIDEO_MEM]

print_string_loop:
    mov al,[ebx]
    mov ah,WHITE_ON_BLCK

    cmp al,0
    je done

    mov [edx],ax

    add ebx,1
    add edx,2

    jmp print_string_loop

done:
    popa 
    ret