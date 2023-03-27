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
	
