.MODEL SMALL
.STACK 

.DATA

	;INTS
	u1 db ?
	u2 db ?
	d1 db ?
	d2 db ?
	c1 db ?
	c2 db ?

	mensaje1 db 13, 'Ingresa un numero $'

	mensaje2 db 13,10, 'Ingresa un numero $'

	mensaje3 db 13,10, 'Resultado $'
	
	punto db '.$'

.CODE

	mov ax, @DATA
	mov ds, ax

	
	;Pedir en cadena(sumando)
	mov ah, 09h
	lea dx, mensaje1
	int 21h

	;Pedir c1
	mov ah, 01h
	int 21h
	sub al, 30h
	mov c1, al

	;Pedir d1
	mov ah, 01h
	int 21h
	sub al, 30h
	mov d1, al

;-----PUNTO------
	mov ah, 09h
	lea dx, punto
	int 21h
;---------------

	;Pedir u1
	mov ah, 01h
	int 21h
	sub al, 30h
	mov u1, al

;----PEDIR SUSTRAENDO------

;Pedir en cadena(sustraendo)
	mov ah, 09h
	lea dx, mensaje2
	int 21h

	;Pedir c1
	mov ah, 01h
	int 21h
	sub al, 30h
	mov c2, al

	;Pedir d1
	mov ah, 01h
	int 21h
	sub al, 30h
	mov d2, al

;-----PUNTO------
	mov ah, 09h
	lea dx, punto
	int 21h
;---------------

	;Pedir u1
	mov ah, 01h
	int 21h
	sub al, 30h
	mov u2, al

;----SUMA---------


;--Unidad 
mov al, u1
add al, u2

AAM ;AH=AL/10 AL=AL mod 10

mov u2, ah
mov u1, al

;--DECENA
mov al, d1
add al, d2
add al, u2 ;Acarreo

AAM

mov d2, ah
mov d1, al

mov al, c1
add al, c2
add al, d2 ;Acarreo

AAM

mov u2, ah ;Movemos el acarreo a "u2" pro puede ser otra
mov c1, al

;-IMPRIMIR-------

	mov ah, 09h
	lea dx, mensaje3
	int 21h

	mov ah, 02h
	add u2, 30h ;valor real
	mov dl, u2 ;Imprimimos las milesimas y pues seleccione u2
	int 21h

	add c1, 30h ;valor real
	mov dl, c1 ;Imprimimos las milesimas y pues seleccione u2
	int 21h

	add d1, 30h ;valor real
	mov dl, d1 ;Imprimimos las milesimas y pues seleccione u2
	int 21h

;-----PUNTO------
	mov ah, 09h
	lea dx, punto
	int 21h
;---------------

	mov ah, 02h
	add u1, 30h ;valor real
	mov dl, u1 ;Imprimimos las milesimas y pues seleccione u2
	int 21h

        mov ah, 4ch
        int 21h
        int 27h

END
