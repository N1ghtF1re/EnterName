        org 100h           ;
                           ;
Start:                     ;
        mov  ah, $09       ; ������� �����
        mov  dx,  prompt   ; ������� �����������
        int  21h           ;
                           ;
EntStr:                    ;
        mov  ah,   $0A     ; ���� ������
        mov  dx, Name      ; ����� � ������� ��� ���
        int  21h           ;
                           ;
CmpSize:                   ; ���������� � ��������� � ���������
        mov  bh, $00       ;
        mov  bl, [Name+1]  ; byte[Name+1] - ����� ������
        cmp  bl,3          ; ��������� bl � 3
        jb   badSize       ; �������, ���� BL < 3 (����� ��� �����)
                           ;
        add  bx, Name + 2  ; � bl ��� ������� ������ ������. �������� � ���� ����� ������ ������
                           ;
        mov  ah, $09       ; ������� �����
        mov  dx, Message   ;
        int  21h           ;
                           ;
                           ;
        mov  ah, $09       ; ������� �����
        mov  dx, Name+2    ; Name - ����. �����, Name + 1 - ������� �����, Name + 2 - ���� ������
        mov  byte[bx], 24h ; 24h - ������ '$', �������� ��� � ����� ������
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
        mov  ah, $09       ; ������� �����
        mov  dx, smallStr  ;
        int  21h           ;
                           ;
        mov  ah, $08       ;
        int 21h            ;
        ret                ;
                           ;

smallStr db "The entered string is too small$"
