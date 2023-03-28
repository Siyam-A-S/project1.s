.data
input:  .space 10	# to store user input (10 characters)
newline: .asciiz "\n"	# for printing a newline character

.text
.globl main
main:
   	# calculate N and M
	# My Howard ID: 03043178
	# N = 26 + (3043178 % 11) = 32
	# M = 32-10 = 22
	# Range: 0-9, a-v, A-V

	# prompt user for input
	li $v0, 8 				# read string system call
	la $a0, input 				# load input buffer
	li $a1, 11 				# maximum length (including null terminator) 
	syscall 				# execute

	# process input
	la $t0, input				# load the address of the user's input

	# initialize registers
	li $t1, 0 				# temporary value holder
	li $t8, 0 				# 0 and 1; check if current index is even or odd
	li $t7, 0 				# initialize position to 0
	li $t2, 0 				# initialize sum to zero
	li $t3, 2 				# holds constant 2 to use in modulo divide
loop:	
	beq $t7, 10, Exit 			# If index==10 exit loop
	lb $t9, ($t0) 				# Load the successive character from $t0

	zeroto9:	bgt $t9, 57, AtoV 		# if character > 9 then jump to AtoV
			blt $t9, 48, next1 		# if character < 0 ignore it
			addiu $t1, $t9, -48 		# assign character's value to $t1
			divu $t7, $t3 			# to check if index is odd or even
			mfhi $t8 			# move the remainder to $t8
			beq $t8, 0, sum1		# jump to addition if index is even 
			subu $t2, $t2, $t1		# subtract $t1 from $t2 if index is odd			  |
			j next1				# to go to the next character
			
		sum1:	addu $t2, $t2, $t1		# add the value in $t1 to $t2
		
		next1:	addiu $t0, $t0, 1		# go to next character's address
			addiu $t7, $t7, 1 		# increase the index by 1
			
			j loop				# jump back again to loop 

	AtoV:		bgt $t9, 86, aTov		# if character > 'V' then jump to aTov 
			blt $t9, 65, next2		# if character < 'A' ignore it
			addiu $t1, $t9, -55		# assign character's value to $t1
			divu $t7, $t3			# to check if index is odd or even
			mfhi $t8			# move the remainder to $t8
			beq $t8, 0, sum2		# jump to addition if index is even 
			subu $t2, $t2, $t1		# subtract $t1 from $t2 if index is odd
			j next2				# to go to the next character


Exit:	
	la $a0, newline
	li $v0, 11
	syscall
	
	li $v0, 1
	addiu $a0, $t2, 0
	syscall
	
	li $v0, 10
	syscall