.data
input:  .space 11	# to store user input (10 characters + null terminator)
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


Exit:	
	la $a0, newline
	li $v0, 11
	syscall