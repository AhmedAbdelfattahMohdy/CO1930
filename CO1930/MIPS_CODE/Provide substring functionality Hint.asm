.data
# The Variavle Section

    text:          .space    100
   
    massege1:    .asciiz "please Enter first indix index : "
     massege2:    .asciiz "please Enter last  indix  index : "
  
.text
# Instruction Section
    
    main:
        
        li $v0, 8        # git user input
        la $a0,text      #pass the adders of the vareable 
        li $a1 , 100     #tell the system the length of the text
        syscall
        
        
        
         li $v0,4
         la $a0 ,massege1
         syscall
    
         li $v0, 5        # read the First index intger
         syscall
         move $a2 ,$v0   #put first intger in t0
         
         li $v0,4
         la $a0 ,massege2
         syscall
    
         li $v0, 5        # read the last index intger
     
         
         move  $a2 ,$v0 #put Last intger in t1
         syscall
         
       
        
      
        
       jal getSubstring
     
    
    
    
    # Tell the System this is the end of main
    li $v0, 10
    syscall
    
    
  getSubstring:
       
       
       addi $t0,$zero, 0  # clear t0 to 0
       
       while :
       bgt $a1,$a2 , exit   #codition
       
       lw $t6,text($t0)
       
       addi $a1,$a1,1 # incrimt for loop
       addi $t0,$t0, 4
       
       li $v0,1
       move $a0,$t6
       syscall
       
       
       
              
       j while
       
         exit :
         
         jr $ra