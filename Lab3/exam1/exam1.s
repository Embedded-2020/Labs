.text
.syntax unified
.align 4
.global main
.type main, %function

main:
    push {ip,lr}
iterator:
    mov r4, #0      /* reset value of count charachter input*/
    mov r5, #10     /* symbol character - new line */

/* Prompt For An Output */
    mov r0, #1      /* stdout */
    ldr r1, =prompt /* location of prompt in memory */
    mov r2, #len    /* length of prompt */
    mov r7, #4      /* write system call */
    swi 0           /* The SWI instruction causes a SWI exception - Software Interrupt */

/* Prompt For An Input */
    mov r0, #0     /*  stdin input prompt */
    ldr r1, =inp_str /* location of inp_str in memory */
    mov r2, #33     /* read 32 characters + plus \n */
    mov r7, #3      /* read system call */
    swi 0

/* Prompt For Checking Exit 'q\n' or 'Q\n' */
    cmp r0, #2
    bne process       /*Go to label "process" if */
    ldrb r3, [r1]
    cmp r3, #81     /* ASCII code for Q */
    beq exit
    cmp r3, #113    /* ASCII code for q */
    beq exit

process:
    ldrb r3, [r1]
    add r4, #1      /* increase */
    cmp r3, #10     /* Check the end '\n' */
    beq print
    cmp r3, #97     /* check for a */
    blt check_upper
    cmp r3, #122    /* check for z */
    ble upper
check_upper:
    cmp r3, #65     /* check for A */
    blt check_mnumber
    cmp r3, #90     /* check for Z */
    ble lower
check_mnumber:
    cmp r3, #48     /* check for >=0  */
    blt check_same
    cmp r3, #57     /* check for =<9  */
    ble number
check_same:
    strb r3, [r1], #1
final:
    cmp r4, #33
    beq print
    b process

upper:
    sub r3, r3, #32
    strb r3, [r1], #1
    b final

lower:
    add r3, r3, #32
    strb r3, [r1], #1
    b final

number:
    cmp r3, #53
    addlt r3, #5
    subge r3, #5
    strb r3, [r1], #1
    b final

print:
    cmp r4, #33
    strbeq r5, [r1, #-1]    /* if 33rd character != '\n' make it '\n' */
    mov r0, #1              /* stdout */
    ldr r1, =inp_str        /* acess string in memory */
    mov r2, r4              /* sizeof string */
    mov r7, #4              /* write system call */
    swi 0
    cmp r4, #33
    beq clear
    b iterator

/* clear buffer */
clear:
    mov r7, #3      /* read system call */
    mov r0, #2
    ldr r1,=inp_str
    mov r2, #(1 << 30) /* clear */
    swi 0
	  b iterator

/* Exit - QUIT*/
exit:
    pop {ip,pc}
    mov r7, #1      /* exit system call */
    swi 0

/* length of prompt is the current memory indicated by (.) minus the memory location of the first element of string*/
.data
	prompt: .ascii "Please input a string 32 char: "
    len = . - prompt

  /*  pre-allocate 32 bytes for input string, initialize them with null character '/0'*/
	inp_str: .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
    inplen = . - inp_str
