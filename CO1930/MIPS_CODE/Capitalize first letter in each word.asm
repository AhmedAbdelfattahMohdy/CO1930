.data
paragraph: .space 80
paragraph_enter: .asciiz "please : Enter the paragraph: "
upper_first_letter: .asciiz "the paragraph after Capitalizing first letter in each word: "

.text
main:
    #Informational message to the user to inter the paragraph 
    li $v0, 4
    la $a0, paragraph_enter
    syscall	

    #get the paragraph from user
    li $v0, 8
    li $a1, 80
    la $a0, paragraph
    syscall
    li $v0, 4      
    la $a0, upper_first_letter
    syscall 
    jal upper_first

    # end of the main function
    li $v0, 10
    syscall	

    
    upper_first:
        # this loop will take the paragraph and convert first letter in each word into upper case
        while:
    	lb $t1, paragraph($t0) #load praragraph 
 	beq $t1, '\0', exit # check if that char is the last char in the paragraph
    	bne $t1, ' ',next      #check space 
    	addi $t0, $t0, 1  # increase iterator  
    	lb $t1, paragraph($t0)
    	li $t4, 'a'     #get val of a
    	blt $t1, $t4, skip #check if that char is already upper case and if true skip
    	li $t4, 'z'            #get val of z
    	bgt $t1, $t4, skip      
    	sub $t1, $t1, 32        #conver first char from lower to upper by subtracting 32 from it  
    	#because of the ASCII of a=97 &  ASCII of A=65
    	sb $t1, paragraph($t0) #store the char to the paragraph after converting it 
    	addi $t0, $t0, 1  # increase iterator
        j while       #branch to while loop     
        
	skip:
    	  addi $t0, $t0, 1  # increase iterator
   	  j while
    	
    	next:     
    	  addi $t0, $t0, 1 
      	  j while
    		
	exit:      #exit and return the paragraph 
    	  li $v0, 4
    	  la $a0, paragraph
    	  syscall
    	  jr $ra