	JMP inicio
puntero EQU 0xFF   
MostrarTexto EQU 0x2E0 

nombre:	DB "Julian Sarmiento"	; string con el nombre
		DB 0					
        
codigo:	DB "1007596687"			; String con el codigo
		DB 0					

inicio:
	MOV SP, puntero			; se crea el puntero de la pila

	MOV C, nombre			; C aloja la variable nombre
	MOV B, MostrarTexto		; Point register D to output
    CALL imprimir
    
    MOV C, codigo			; se reasigna C con el codigo
    MOV D, MostrarTexto		; asigna el valor a B para Mostrar el texto
	CALL imprimir
	HLT						; finaliza la ejecucion


imprimir:					; funcion imprimir
	PUSH A
	PUSH D
	MOV D, 0
    
.ciclo:
	MOVB AL, [C]		; Obtiene el valor
	MOVB [B], AL		; imprime el valor
	INC C
	INC B
	CMPB DL, [C]		; valida si el string ya acabo
	JNZ .ciclo			; reinicia al ciclo si no ha acabado

	POP D
	POP A
	RET
