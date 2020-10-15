;*****************************************************************
;* This stationery serves as the framework for a                 *
;* user application (single file, absolute assembly application) *
;* For a more comprehensive program that                         *
;* demonstrates the more advanced functionality of this          *
;* processor, please see the demonstration applications          *
;* located in the examples subdirectory of the                   *
;* Freescale CodeWarrior for the HC12 Program directory          *
;*****************************************************************
; Created by: Vincent To 500824873
; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry                  ; for absolute assembly: mark 
                                            ;this as application entry point

; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 
		
;*****************************************************************
;* Code section *                                                *
;*****************************************************************
              ORG $500       ;Starting at address 500
MULTIPLIER    FCB 07         ;First Number at address 500
MULTIPLICAND  FCB 03         ;Second Number at address 501
PRODUCT       RMB 2          ;2 byte placeholder for PRODUCT at address 502 & 503

; variable/data section

           ORG $510                
Entry:
_Startup:
          LDAA MULTIPLICAND       ; Get the first number into ACC A
          LDAB MULTIPLIER         ; Second number to ACC B
          MUL                     ; Multiply the two numbers
          STD  PRODUCT            ; store product
          SWI                     ; break to the monitor


;*****************************************************************
;*                 Interrupt Vectors                             *
;*****************************************************************
            ORG   $FFFE
            FDB   Entry           ; Reset Vector
