ORG 00H
 LJMP MAIN 
 ORG 30H
  MAIN:
 MOV DPTR , #MYDATA
 START:
 MOV R0,#00H
 MOV R1,#00H
 MOV R2,#00H
 MOV R3,#00H
 MOV R4,#00H
 MOV R5,#00H
 
 CJNE R7 ,#0D , DISPLAY
 MOV R0,#0H
 MOV R1,#0H
 MOV R2,#0H
 MOV R3,#0H
 MOV R4,#0H
 MOV R5,#0H
 MOV R7,#00H
 
 
 DISPLAY:
 INC R7
 ACALL SHOW
 BACK:
 INC R0
 CJNE R0, #10D, DISPLAY
 MOV R0, #00H
 INC R1
 CJNE R1, #6D ,DISPLAY
 MOV R1, #00H
 INC R2
 CJNE R2,#10D,DISPLAY
 MOV R2,#00H
 INC R3
 CJNE R3,#6D,DISPLAY
 MOV R3,#00H
 MOV A,R5
 XRL A, #2D
 JZ SCREENSHOT
 JNZ BLA
 BLA:
 INC R4
 CJNE R4,#10D,DISPLAY
 MOV R4,#00H
 SJMP BLABLA
 SCREENSHOT:
 INC R4
 CJNE R4,#4D,DISPLAY
 MOV R4 ,#00H
 MOV R5,#02D
 
 BLABLA:
 INC R5
 CJNE R5,#3D,DISPLAY
 SJMP START
 
 SHOW:
 MOV R6,#82D
 REPEAT:
 MOV A,R0
 MOVC A,@A+DPTR
 SETB P2.0
 MOV P1,A
 ACALL DELAY
 CLR P2.0
 MOV A,R1
 MOVC A,@A+DPTR
 SETB P2.1
 MOV P1,A
 ACALL DELAY
 CLR P2.1
 MOV A,R2
 MOVC A,@A+DPTR
 SETB P2.2
 MOV P1,A
 ACALL DELAY
 CLR P2.2
 MOV A,R3
 MOVC A,@A+DPTR
 SETB P2.3
 MOV P1 ,A
 ACALL DELAY
 CLR P2.3
 MOV A,R4
 MOVC A,@A+DPTR
 SETB P2.4
 MOV P1,A
 ACALL DELAY
 CLR P2.4
 MOV A,R5
 MOVC A,@A+DPTR
 SETB P2.5
 MOV P1,A
 ACALL DELAY
 CLR P2.5
 DJNZ R6, REPEAT
 RET
 
 DELAY:
 SETB PSW. 4
 MOV R2,#10
 AGAIN2: MOV R3 ,#100
 AGAIN1:DJNZ R3,AGAIN1
 DJNZ R2 , AGAIN2
 CLR PSW. 4
 RET
 
 ORG 300H
  MYDATA:
  DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH
   END
