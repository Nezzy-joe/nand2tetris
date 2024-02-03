// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// This program multiplies the value of R0 and R1 and then stores the result in R2. and then it uses the loop to repeately add the value in R1 to R2 until the value in R0 becomes zero or negative, the final result is in R2. 


// PSEUDO CODE
// x=R0
// y=R1
// R2=0
// while(x > 0) {
//     R2 += y
//     x--
// }

	@R0
	D=M
	@x
	M=D	// x = R0

	@R1
	D=M
	@y
	M=D	// y = R1

	@0
	D=A
	@R2
	M=D	// R2 = 0

(WHILE)
	// begin of loop condition
	@x
	D=M	// load R0 for loop condition
	@END
	D;JLE	// if x <= 0 goto END      
	// end of loop condition

	// begin body of while
	@y
	D=M	// D = y
	@R2
	M=D+M	// sum = sum + y
	@1
	D=A	// D = 1
	@x
	M=M-D	// x = x - 1	
	// end body of while

	@WHILE
	0;JMP	// jump to loop start
(END)	
	@END
	0;JMP	// Infinite loop (program end)
