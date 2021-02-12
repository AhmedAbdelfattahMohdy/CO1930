.data

    string1: .space 100      
    string2: .space 30       
    paragraph: .asciiz "Please enter the paragraph: "    
    word: .asciiz "Please enter a word: "       
   
           
 .text
 
    main:
     #  print the masseg pragraph
    li $v0, 4      
    la $a0, paragraph     
    syscall          
    
    #geting paragraph from user
    li $a1, 100     
    la $a0, string1   
    li, $v0, 8      
    syscall         
   

    #  print the masseg word
    li $v0, 4       
    la $a0, word        
    syscall         
    
     #geting word from user
    li $a2, 30
    la $a0, string2           
    li, $v0, 8      
    syscall  
    jal search_word_or_character
    
    #the end of main function
    li $v0,10
    syscall        
   
   search_word_or_character:
   addi $t0,$zero,0  #varibale j
   addi $t1 ,$zero,0 #varible  c		
    while:
       lb $t2, string2($t0) #the while to tcheck null 
       beq $t1, '\0', exit1 
       addi $t0, $t0, 1
       add  $t1, $t0,$0
   j while
   # the end while				
    exit1:
    li $v0, 4
    la $a0, word
    
    wloop:  # tcheak paragraph is null         
    lb $t0, paragraph($t8)    
    beq $t0,'\0', exit2  
    sb $t0, 0($s5)      
    addi $t8, $t8, 1   
    addi $s5, $s5, 1   
    j wloop         
    la $s4, paragraph 
    # if word is oredy or not
    checkword:
    addi $s4, $s4, 1    
    addi $s5, $s5, 1    
    lb $t1, 0($s4)   
    lb $t0, 0($s5)      
    bne $t1, $t0, count			
    syscall
    exit2:
    li $v0,4
    la $a0,paragraph
    syscall 
    jr $ra	    
   		
   		
    