;This Will make the BIOS run an infinite loop, i.e the BIOS will stuck at the message booting from hard disk, This is in order to make BIOS running instead of exiting after reading the boot sector

loop:               ;tag to jump back
    jmp loop        ;endless jump

times 510-($-$$) db 0 ;write 0 510 times

dw 0xaa55           ;write 0xaa55 magic number at the end