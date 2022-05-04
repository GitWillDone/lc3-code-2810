.ORIG x3000
LD R2, NEWLINE_NEG
ADD R3, R3, #0
LD R6, ASCII       

JSR LOOP_START

NEWLINE_NEG .FILL x-000A ; store the NEGATIVE value for a newline character
INPUT_STRING .blkw #80; allocation enough space to store a character string of 200 individual characters;
INPUT_PROMPT .stringz "\nEnter an LC-3 Instruction: \n"
ASCII .FILL x005F

; @SUBROUTINE
LOOP_START;DONE
    LEA R0, INPUT_PROMPT            ; Print Prompt to screen
    PUTS
 
    GETC                        ; Read char
    OUT
    AND R0, R6, R0              ;TESTS FOR CASE
    ADD R1, R0, #0              ; Save R0 value in R1
    
    LD R5, LET_A             ; Test For letter A
    ADD R0, R0, R5
    BRz ST_A
    
    ADD R0, R1, #0              ; Restore R0

    LD R5, LET_Q                ; Test For letter Q
    ADD R0, R0, R5
    BRz ST_Q

    ADD R0, R1, #0              ; Restore R0

    LD R5, LET_B                ; Test For letter B
    ADD R0, R0, R5
    BRz ST_B

    ADD R0, R1, #0              ; Restore R0

    LD R5, LET_J                ; Test For letter J
    ADD R0, R0, R5
    BRz ST_J

    ADD R0, R1, #0              ; Restore R0

    LD R5, LET_L                ; Test For letter L
    ADD R0, R0, R5
    BRz ST_L

    ADD R0, R1, #0              ; Restore R0

    LD R5, LET_N              ; Test For letter N
    ADD R0, R0, R5
    BRz ST_N

    ADD R0, R1, #0              ; Restore R0

    LD R5, LET_R                ; Test For letter R
    ADD R0, R0, R5
    BRz ST_R

    ADD R0, R1, #0              ; Restore R0

    LD R5, LET_S                ; Test For letter S
    ADD R0, R0, R5
    BRz ST_S

    ADD R0, R1, #0              ; Restore R0

    LD R5, LET_T                ; Test For letter T
    ADD R0, R0, R5
    BRz ST_T

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z
    Z   JSR ERROR

; @SUBROUTINE
ST_A; DONE
    GETC
    OUT
    AND R0, R6, R0    

    ADD R1, R0, #0

    LD R5, LET_D            ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST_AD

    ADD R0, R1, #0

    LD R5, LET_N
    ADD R0, R0, R5
    BRz ST_AN

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1 
    A1 JSR ERROR

; @SUBROUTINE
ST_Q; DONE
    GETC
    OUT
    AND R0, R6, R0    
    ADD R1, R0, #0

    LD R5, LET_U            ; Test for Letter '' in State ''
    ADD R0, R0, R5
    BRz ST_QU

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_B; DONE
    GETC
    OUT
    AND R0, R6, R0    
    LD R5, LET_R            ; Test for Letter '' in State ''
    ADD R0, R0, R5
    BRz ST_BR

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_J;DONE
    GETC
    OUT
    AND R0, R6, R0    
    ADD R1, R0, #0

    LD R5, LET_M            ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST_JM

    ADD R0, R1, #0

    LD R5, LET_S
    ADD R0, R0, R5
    BRz ST_JS

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_L;DONE
    GETC
    OUT
    AND R0, R6, R0    
    ADD R1, R0, #0

    LD R5, LET_D            ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST_LD

    ADD R0, R1, #0

    LD R5, LET_E
    ADD R0, R0, R5
    BRz ST_LE

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_N;DONE
    GETC
    OUT
    AND R0, R6, R0    
    LD R5, LET_O            ; Test for Letter '' in State ''
    ADD R0, R0, R5
    BRz ST_NO

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_R ;DONE
    GETC
    OUT
    AND R0, R6, R0    
    ADD R1, R0, #0

    LD R5, LET_E            ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST_RE

    ADD R0, R1, #0

    LD R5, LET_T
    ADD R0, R0, R5
    BRz ST_RT

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_S ;DONE
    GETC
    OUT
    AND R0, R6, R0    
    LD R5, LET_T            ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST_ST

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_T; LETTERS DONE
    GETC
    OUT
    AND R0, R6, R0    
    LD R5, LET_R            ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST_TR

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

    LET_A .FILL #-65
    LET_B .FILL #-66
    LET_D .FILL #-68
    LET_E .FILL #-69
    LET_I .FILL #-73
    LET_J .FILL #-74
    LET_L .FILL #-76
    LET_M .FILL #-77
    LET_N .FILL #-78
    LET_O .FILL #-79
    LET_P .FILL #-80
    LET_Q .FILL #-81
    LET_R .FILL #-82
    LET_S .FILL #-83
    LET_T .FILL #-84
    LET_U .FILL #-85
    
; @SUBROUTINE
ST_AD; DONE
    GETC
    OUT
    AND R0, R6, R0    
    LD R5, LET_D            ; Test for Letter D in State AD
    ADD R0, R0, R5
    BRz AD1
        
    AND R0, R0, #0             ; Set R0 to 0
    BRz A1
    AD1 JSR ST_ADD



; @SUBROUTINE
ST_AN;DONE
    GETC
    OUT
    AND R0, R6, R0  
    LD R5, LET_D            ; Test for Letter D in State AN
    ADD R0, R0, R5
    BRz ST_AND

    AND R0, R0, #0             ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_QU;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R1, R0, #0

    LD R5, LET_I            ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST_QUI

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_BR; DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz BRPROMPT
    BRp BR1

    BRPROMPT   LEA R0, BR_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z2
    BR1 JSR ERROR

    BR_PROMPT .stringz "\n The opcode for BR is 0000\n"

; @SUBROUTINE
ST_JM;DONE
    GETC
    OUT
    AND R0, R6, R0
    LD R5, LET_P            ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST_JMP

    AND R0, R0, #0           ; Set R0 to 0
    BRz A1

; @SUBROUTINE
ST_JS;DONE
    GETC
    OUT
    AND R0, R6, R0
    LD R5, LET_R           ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz JS1
    
    AND R0, R0, #0           ; Set R0 to 0
    BRz A1
    JS1 JSR ST_JSR

; @SUBROUTINE
ST_LD;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R1, R0, #0

    LD R5, LET_I           ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz LD1

    ADD R0, R1, #0

    LD R5, LET_R
    ADD R0, R0, R5
    BRz LD2

    ADD R0, R1, #0

    ADD R0, R0, R2
    BRz LD4

    BRp LD3
    LD4    LEA R0, LD_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS 
    AND R0, R0, #0           ; Set R0 to 0
    BRz Z2

    LD1 JSR ST_LDI
    LD2 JSR ST_LDR
    LD3 JSR ERROR
    LD_PROMPT .stringz "\n The opcode for LD is 0010\n"

; @SUBROUTINE
ST_LE;DONE
    GETC
    OUT
    AND R0, R6, R0
    LD R5, LET_A           ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz LE1
    
    AND R0, R0, #0           ; Set R0 to 0
    BRz A1
    LE1 JSR ST_LEA

; @SUBROUTINE
ST_NO;DONE
    GETC
    OUT
    AND R0, R6, R0  
    LD R5, LET_T           ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz NO1
    
    AND R0, R0, #0           ; Set R0 to 0
    BRz A1
    NO1 JSR ST_NOT

; @SUBROUTINE
ST_RE ;DONE
    GETC
    OUT
    AND R0, R6, R0
    LD R5, LET_T           ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz RE1

    AND R0, R0, #0           ; Set R0 to 0
    BRz A2
    RE1 JSR ST_RET

; @SUBROUTINE
ST_RT ;DONE
    GETC
    OUT
    AND R0, R6, R0
    LD R5, LET_I           ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz RT1

    AND R0, R0, #0           ; Set R0 to 0
    BRz A2
    RT1 JSR ST_RTI

; @SUBROUTINE
ST_ST ;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R1, R0, #0

    LD R5, LET_I           ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST1
    
    ADD R0, R1, #0

    LD R5, LET_R
    ADD R0, R0, R5
    BRz ST2

    ADD R0, R1, #0

    ADD R0, R0, R2
    BRz ST4
    
    BRp ST3
    
    ST4 LEA R0, ST_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0           ; Set R0 to 0
    BRz Z2
    ST1 JSR ST_STI
    ST2 JSR ST_STR
    ST3 JSR ERROR

    ST_PROMPT .stringz "\n The opcode for ST is 0011\n"

; @SUBROUTINE
ST_TR ;DONE
    GETC
    OUT
    AND R0, R6, R0
    LD R5, LET_A           ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz TR1
    
    AND R0, R0, #0           ; Set R0 to 0
    BRz A2
    TR1 JSR ST_TRA
    A2 JSR ERROR

ST_QUI; DONE, check for random 
    GETC
    OUT
    AND R0, R6, R0
    ADD R1, R0, #0

    LD R5, LET_T           ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz QUI1
    ;BRp E1
    AND R0, R0, #0           ; Set R0 to 0
    BRz A2
    Z2  JSR LOOP_START
    ;E1 JSR ERROR
    QUI1 JSR ST_QUIT

; @SUBROUTINE
ST_AND;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2
    BRz ANDPROMPT
    BRp AND1
    ANDPROMPT   LEA R0, AND_PROMPT
    PUTS
    AND R0, R0, #0             ; Set R0 to 0
    BRz Z2
    AND1 JSR ERROR
    AND_PROMPT .stringz "\n The opcode for AND is 0101\n"

; @SUBROUTINE
ST_ADD; DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz ADDPROMPT
    BRp ADD1

    ADDPROMPT   LEA R0, ADD_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z2
    ADD1 JSR ERROR

    ADD_PROMPT .stringz "\nThe opcode for ADD is 0001\n"

; @SUBROUTINE
ST_JMP;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz JMPPROMPT
    BRp JMP1

    JMPPROMPT   LEA R0, JMP_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z2
    JMP1 JSR ERROR

    JMP_PROMPT .stringz "\n The opcode for JMP is 1100\n"


; @SUBROUTINE
ST_JSR;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R1, R0, #0

    ADD R0, R0, R2
    BRz JSRPROMPT

    ADD R0, R1, #0

    LD R5, LET_R2           ; Test for Letter R in State A
    ADD R0, R0, R5
    BRz JSR1

    JSRPROMPT   LEA R0, JSR_PROMPT
    PUTS

    AND R0, R0, #0           ; Set R0 to 0
    BRz Z2

    JSR1 JSR ST_JSRR
    LET_R2 .FILL #-82
    JSR_PROMPT .stringz "\n The opcode for JSR is 0100\n"

; @SUBROUTINE
ST_LDR;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz LDRPROMPT
    BRp LDR1

    LDRPROMPT   LEA R0, LDR_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z2
    LDR1 JSR ERROR

    LDR_PROMPT .stringz "\n The opcode for LDR is 0110\n"

; @SUBROUTINE
ST_LDI;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz LDIPROMPT
    BRp LDI1

    LDIPROMPT   LEA R0, LDI_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z2
    LDI1 JSR ERROR

    LDI_PROMPT .stringz "\n The opcode for LDI is 1010\n"


; @SUBROUTINE
ST_LEA;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz LEAPROMPT
    BRp LEA1

    LEAPROMPT   LEA R0, LEA_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z3
    LEA1 JSR ERROR

    LEA_PROMPT .stringz "\n The opcode for LEA is 1110\n"

; @SUBROUTINE
ST_NOT;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz NOTPROMPT
    BRp NOT1

    NOTPROMPT   LEA R0, NOT_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z3
    NOT1 JSR ERROR

    Z3  JSR LOOP_START

    NOT_PROMPT .stringz "\n The opcode for NOT is 1001\n"


; @SUBROUTINE
ST_RET;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz RETPROMPT
    BRp RET1

    RETPROMPT   LEA R0, RET_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z3
    RET1 JSR ERROR

    RET_PROMPT .stringz "\n The opcode for RET is 1100\n"

; @SUBROUTINE
ST_RTI;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz RTIPROMPT
    BRp RTI1

    RTIPROMPT   LEA R0, RTI_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z1
    RTI1 JSR ERROR

    RTI_PROMPT .stringz "\n The opcode for RTI is 1000\n"

; @SUBROUTINE
ST_STR;DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz STRPROMPT
    BRp STR1

    STRPROMPT   LEA R0, STR_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z1
    STR1 JSR ERROR

    STR_PROMPT .stringz "\n The opcode for STR is 0111\n"

; @SUBROUTINE
ST_STI; DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz STIPROMPT
    BRp STI1

    STIPROMPT   LEA R0, STI_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z1
    STI1 JSR ERROR

    STI_PROMPT .stringz "\n The opcode for STI is 1011\n"

; @SUBROUTINE
ST_TRA ;DONE
    GETC
    OUT
    AND R0, R6, R0
    LD R5, LET_P2             ; Test for Letter D in State A
    ADD R0, R0, R5
    BRz ST_TRAP

    AND R0, R0, #0           ; Set R0 to 0
    BRz A3

    LET_P2 .FILL #-80
    A3 JSR ERROR

; @SUBROUTINE
ST_QUIT; DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2
    BRz EXIT
    BRp ERROR
    
; @SUBROUTINE
ST_TRAP; DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2

    BRz TRAPPROMPT
    BRp TRAP1

    TRAPPROMPT   LEA R0, TRAP_PROMPT
    PUTS
    ; Fill ADD_OPCODE with 0001
    ; load it into register R0
    ; print out that string PUTS

    AND R0, R0, #0             ; Set R0 to 0
    BRz Z1
    TRAP1 JSR ERROR

    TRAP_PROMPT .stringz "\n The opcode for TRAP is 1111\n"

; @SUBROUTINE
ST_JSRR; DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2
    BRz JSRRPROMPT
    BRp JSRR1
    JSRRPROMPT   LEA R0, JSRR_PROMPT
    PUTS
    AND R0, R0, #0             ; Set R0 to 0
    BRz Z1
    JSRR1 JSR ERROR
    Z1 JSR LOOP_START
    JSRR_PROMPT .stringz "\n The opcode for JSRR is 0100\n"

; @SUBROUTINE
ERROR; DONE
    GETC
    OUT
    AND R0, R6, R0
    ADD R0, R0, R2
    BRz E1
    BRnp ERROR
    E1    LEA R0, ERROR_PROMPT
    PUTS
    JSR Z3
    ERROR_PROMPT .stringz "\n PLEASE enter a valid instruction\n"

; @SUBROUTINE
EXIT    
    HALT

.END