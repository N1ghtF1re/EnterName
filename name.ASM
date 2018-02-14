        org 100h           ;
                           ;
Start:                     ;
        mov  ah, $09       ; Выводим текст
        mov  dx,  prompt   ; Выводим приветствие
        int  21h           ;
                           ;
EntStr:                    ;
        mov  ah,   $0A     ; Ввод строки
        mov  dx, Name      ; Метка с адресом под имя
        int  21h           ;
                           ;
CmpSize:                   ; Подготовка и сравнение с минимумом
        mov  bh, $00       ;
        mov  bl, [Name+1]  ; byte[Name+1] - длина строки
        cmp  bl,3          ; Сравнение bl и 3
        jb   badSize       ; Переход, если BL < 3 (числа без знака)
                           ;
        add  bx, Name + 2  ; В bl уже записан размер строки. Прибавим к нему адрес начала строки
                           ;
        mov  ah, $09       ; Выводим текст
        mov  dx, Message   ;
        int  21h           ;
                           ;
                           ;
        mov  ah, $09       ; Выводим текст
        mov  dx, Name+2    ; Name - макс. длина, Name + 1 - текущая длина, Name + 2 - сама строка
        mov  byte[bx], 24h ; 24h - символ '$', помещаем его в конец строки
                           ;
        int 21h            ;
                           ;
        mov  ah, $08       ;
        int 21h            ;
        ret                ;
                           ;
Message db 13,10,"Hello, $";
Name db 98,100 dup(?)      ;
prompt db "Hello, please, enter your name",13,10,"$"
                           ;
badSize:                   ;
        mov  ah, $09       ; Выводим текст
        mov  dx, smallStr  ;
        int  21h           ;
                           ;
        mov  ah, $08       ;
        int 21h            ;
        ret                ;
                           ;

smallStr db "The entered string is too small$"
