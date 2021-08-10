## INTRO

This Repo contains basic of OS (or Say How to Build an OS):

To get started you need 2 tools, nasm and qemu
nasm is a assembly compiler which compiles the assembly code to machine code(binary)
qemu is a machine emulator and virtualizer which takes a boot image and runs it emulating as it is running on a real CPU.
```bash
#TO INSTALL THESE ON MAC RUN 
brew install nasm qemu
```

To run the bootsector code simply compile them using nasm
```bash
nasm <filename.asm>
```
Once the files are compiled, to run them on the qemu emulator type
```bash
qemu-system-i386 ./machine_code
```

you can use any system you want to emulate using qemu, here system_i386 means use an 32 bit intel microprocesser 

you can create your own kernel and bootstrap that with bootsector code to run it on bootup

To create kernel and run it, 
edit the kernel.c file, the current kernel.c file simply prints a character P on the top right screen

Once edited run the following commands

```bash
gcc -ffreestanding -c kernel.c -o kernel.o

ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary

nasm boot_sector.asm

cat boot_sector kernel.bin > mykernel

qemu-system-i386 mykernel
```

