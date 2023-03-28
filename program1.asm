#Group: AHHHH (Khushi Gupta, Remi Ong, Tam Dinh, Viet Nguyen)
#Date: 3/27/2023
#Program: Program 1 
#Github link: https://github.com/djRemskii/mips_practice_AHHHH


.data
    #create variables here
    task1: .asciiz "=== Task 1 ==="
    prompt: .asciiz "\nPlease enter an integer: "
    
    task2: .asciiz "\n\n=== Task 2===\nResult:\n"
    add2: .asciiz "Add: "
    sub2: .asciiz "\nSubtract: "
    mul2: .asciiz "\nMultiple: "
    div2: .asciiz "\nDivide: "
    
    task3: .asciiz "\n\n=== Task 3 ===\nResult:"
    sameMSG: .asciiz "\nUser inputs are the same."
    diffMSG: .asciiz "\nUser inputs are different."

.text
    main:
#   Task 1: User Input and Output
#   In this task, you will practice getting user input, moving them to registers, and printing them back to the user. Below are the specific requirements for this task:
#       A. Use "main: " label for this task
#       B. Get 2 int values from the user
#       C. The two user values should be held in registers $s0 and $s1, respectively
#       D. Output the user inputs in the "Run I/O" section in MARS environment back to the user

    	li $v0, 4	#Output string of task1
    	la $a0, task1
    	syscall
    	
    	li $v0, 4         #output string in a0
    	la $a0, prompt 	  #load string from data into a0
    	syscall           #Execute

    	li $v0, 5         #read user input form console
    	syscall           #execute

    	move $s0, $v0	  # move user input from v0 to s0 new register

    	li $v0, 1	  #print out what whatevers in a0 same as before but with a integer this time
    	move $a0, $s0    #move the value in s0 (which is user input) into a0
    	syscall		  #execute
    	
    	li $v0, 4         #output string in a0
    	la $a0, prompt 	  #load string from data into a0
    	syscall           #Execute

    	li $v0, 5         #read user input form console
    	syscall           #execute

    	move $s1, $v0	  # move user input from v0 to s0 new register
    
    	li $v0, 1	  #print out what whatevers in a0 same as before but with a integer this time
    	move $a0, $s1    #move the value in s1 (which is user input) into a0
    	syscall		  #execute
    	
#   Task 2: Arithmetic Operation Practice
#   Using the user input values in registers $s0 and $s1, write MIPS Assembly code to complete the arithmetic operations below:
#       A. add two values (use instruction "add")
#       B. subtract two values (use instruction "sub")
#       C. multiply two values (use instruction "mul")
#       D. divide two values (use instruction "div")
#       E. Output the arithmetic results in the "Run I/O" section in MARS environment back to the user

	li $v0, 4   #output string of task2
    	la $a0, task2
    	syscall
    	
    	add $t0, $s0, $s1  #perform add
    	sub $t1, $s0, $s1  #perform sub
 	mul $t2, $s0, $s1  #perform mul
    	div $t3, $s0, $s1  #perform div
 
  	li $v0, 4 #output string Add:"
    	la $a0, add2
    	syscall
    	
    	li $v0, 1 #output add result in int"     
    	move $a0, $t0  #move to register $a0
    	syscall   
    	
    	li $v0, 4 #output string Subtract:"
    	la $a0, sub2
    	syscall 
    	
    	li $v0, 1 #output sub result in int"
   	move $a0, $t1 #move to register $a0
    	syscall  
    	
    	li $v0, 4  #output string Multiple:"
    	la $a0, mul2
    	syscall 
    	
    	li $v0, 1 #output mul result in int"
    	move $a0, $t2  #move to register $a0
    	syscall   
    	
    	li $v0, 4 #output string Divide:"
    	la $a0, div2
    	syscall 
    	
    	li $v0, 1 #output div result in int"
    	move $a0, $t3  #move to register $a0
    	syscall        

	    		
#   Task 3: Conditions
#   In this final task, you will practice how to do conditions in Assembly:
#       A. If the two user inputs from Task 1 are equal to each other, output "User inputs are the same"
#       B. If the two user inputs from Task 1 are not equal to each other, output "User inputs are different"
                
	li $v0, 4   #output string of task3
    	la $a0, task3
    	syscall
                
    	# Compare s0 and s1
    	beq $s0, $s1, same  # Branch to 'same' label if s0 = s1
    	li $v0, 4           # output string in a0
    	la $a0, diffMSG        # load string from data into a0
    	syscall              
    	j end                
    
same:
    li $v0, 4           # output string in a0
    la $a0, sameMSG        # load string from data into a0
    syscall  
              

end:
    # exit 
    li $v0, 10     
    syscall

    	
