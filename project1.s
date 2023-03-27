.data
input:  .space 11	# to store user input (10 characters + null terminator)
newline: .asciiz "\n"	# for printing a newline character

.text
.globl main
main:
   	# calculate N and M
	li $t0, 03043178     # load Howard ID as decimal integer
    	rem $t1, $t0, 11     # X % 11
    	addiu $t2, $zero, 26 # N = 26 + (X % 11)
    	addu $t2, $t2, $t1
    	subu $t3, $t2, 10    # M = N - 10

	# prompt user for input
	li $v0, 8 				# read string system call
	la $a0, input 				# load input buffer
	li $a1, 11 				# maximum length (including null terminator) 
	syscall 				# execute

	# process input
