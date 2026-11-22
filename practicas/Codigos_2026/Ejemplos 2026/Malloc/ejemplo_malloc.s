.global main
main:
        pushq   %rbp
        movq    %rsp, %rbp
        
        movl    $16, %edi       
        call    malloc               # reserva 16 bytes
        
        testq   %rax, %rax           # comprobar NULL
        je      malloc_failed
    
    
        movq    %rax, %rdi           # guardo el puntero original
        movl    $0x11, (%rdi)
        movl    $0x22, 4(%rdi)
        movl    $0x33, 8(%rdi)
        movl    $0x44, 12(%rdi)
        
        movq    %rax, %rdi          # argumento para free
        call    free                # libera el bloque
        
        movl    $0, %eax        
        leave
        ret
        
malloc_failed:
        # En caso de fallo, devolver código de error (por ejemplo 1)
        movl    $1, %eax
        leave
        ret