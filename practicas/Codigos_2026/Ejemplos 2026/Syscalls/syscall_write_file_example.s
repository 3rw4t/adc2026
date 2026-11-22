.data
filename: .ascii "salida.txt\0"                # nombre del archivo
msg: .ascii "Hola desde syscalls en ensamblador!\n"
len = . - msg

.text
.global main
main:
    # syscall: open("salida.txt", O_WRONLY|O_CREAT|O_TRUNC, 0644)
    mov     $2, %rax                     # SYS_open = 2
    lea     filename(%rip), %rdi         # 1er argumento: puntero al nombre
    mov     $0101 | 01000, %rsi          # 2º argumento: O_WRONLY(1) | O_CREAT(64) | O_TRUNC(512)
    mov     $0644, %rdx                  # 3er argumento: permisos (rw-r--r--)
    syscall
    mov     %rax, %rdi                   # guardar fd en %rdi

    # syscall: write(fd, msg, len)
    mov     $1, %rax                     # SYS_write = 1
    lea     msg(%rip), %rsi              # 2º argumento: puntero al mensaje
    mov     $len, %rdx                   # 3º argumento: longitud
    syscall

    # syscall: close(fd)
    mov     $3, %rax                     # SYS_close = 3
    syscall

    # syscall: exit(0)
    mov     $60, %rax                    # SYS_exit = 60
    xor     %rdi, %rdi                   # código de salida = 0
    syscall

