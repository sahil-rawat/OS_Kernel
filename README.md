## INTRO

This Repo contains basic of OS (or Say How to Build an OS):

To get started you need 2 tools, nasm and qemu
nasm is a assembly compiler which compiles the assembly code to machine code(binary)
qemu is a machine emulator and virtualizer which takes a boot image and runs it emulating as it is running on a real CPU.
```bash
#TO INSTALL THESE ON MAC RUN 
brew install nasm qemu
```


To run the bootsector simply compile them using nasm
```bash
nasm <filename.asm>
```
Once the files are compiled, to run them on the qemu emulator type
```bash
qemu-system-i386 ./machine_code
```

you can use any system you want to emulate using qemu, here system_i386 means use an 32 bit intel microprocesser 