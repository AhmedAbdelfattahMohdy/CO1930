.data
paragraph: .space 40
welcome: .asciiz "Enter the paragraph: "
uppercase: .asciiz "the upper case is: "

.text
main:
    #printing a message to user to inter the paragraph
    li $v0, 4
    la $a0, welcome
    syscall	

    #gitting the paragraph from user
    li $v0, 8
    li $a1, 40
    la $a0, paragraph
    syscall
    li $v0, 4      
    la $a0, uppercase
    syscall 
    jal upper

    #the end of main function
    li $v0, 10
    syscall	

    
	   upper:
		# loop that takes the paragraph and converting it to upper case
		while:
    		lb $t1, paragraph($t0)
    		beq $t1, '\0', exit # check if the mean char is the last char of the paragraph
    		li $t4, 'a' #gitting the value of a
    		blt $t1, $t4, donoting #check if the maen character is already upper case and if true do nothing
    		li $t4, 'z' #gitting the value of z
    		bgt $t1, $t4, donoting
    		sub $t1, $t1, 32 #conver the lower case char by subtract 32 from it to uppercase
    		sb $t1, paragraph($t0) #store the char to the paragraph after converting it 
    		addi $t0, $t0, 1  # increase iterator
                j while       #branch to while loop     beq $0,$0
		donoting:
    		addi $t0, $t0, 1  # increase iterator
    		j while
		exit:
    		li $v0, 4
    		la $a0, paragraph
    		syscall
    		jr $ra